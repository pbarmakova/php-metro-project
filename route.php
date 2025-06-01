<?php
header('Content-Type: application/json; charset=utf-8');

require_once 'db.php';
require_once 'dijkstra.php';

if (!isset($_GET['from']) || !isset($_GET['to'])) {
    echo json_encode(["error" => "Параметры 'from' и 'to' обязательны"]);
    exit;
}

$from = (int)$_GET['from'];
$to = (int)$_GET['to'];

$pdo = getPDO();
$graph = buildGraph($pdo);
$path = dijkstra($graph, $from, $to);

if (empty($path)) {
    echo json_encode(["error" => "Маршрут не найден"]);
    exit;
}

// Получаем названия станций
$inClause = implode(',', array_map('intval', $path));
$sql = "SELECT id, name FROM stations WHERE id IN ($inClause)";
$stations = $pdo->query($sql)->fetchAll(PDO::FETCH_KEY_PAIR);

// Собираем маршрут
$route = array_map(fn($id) => ['id' => $id, 'name' => $stations[$id] ?? '???'], $path);

// Считаем общее время
$totalTime = 0;
$pathCount = count($path);

for ($i = 0; $i < $pathCount - 1; $i++) {
    $id1 = $path[$i];
    $id2 = $path[$i + 1];

    // Определяем, какую станцию считать отправной
    $isFirst = ($i === 0);                         // если это первый шаг маршрута
    $isLast  = ($i + 1 === $pathCount - 1);        // если это последний шаг маршрута

    $column = ($isFirst || $isLast) ? 'time' : 'travel_time';

    $stmt = $pdo->prepare("
        SELECT $column FROM connections 
        WHERE (station_id1 = :id1 AND station_id2 = :id2) 
           OR (station_id1 = :id2 AND station_id2 = :id1)
        LIMIT 1
    ");
    $stmt->execute(['id1' => $id1, 'id2' => $id2]);
    $row = $stmt->fetch();

    if ($row) {
        $totalTime += (float)$row[$column];
    }
}


echo json_encode([
    "from" => $from,
    "to" => $to,
    "route" => $route,
    "total_time" => $totalTime
], JSON_UNESCAPED_UNICODE);
