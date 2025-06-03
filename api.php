<?php
header('Content-Type: application/json; charset=utf-8');
require_once 'db.php';
$pdo = getPDO();

try {
    // Получаем станции
    $stations = $pdo->query("SELECT id, name, line, x, y, label_offset_y, label_offset_x FROM stations")->fetchAll();

    // Получаем соединения
    $connections = $pdo->query("SELECT station_id1, station_id2 FROM connections")->fetchAll();

    echo json_encode([
        "stations" => $stations,
        "connections" => $connections
    ], JSON_UNESCAPED_UNICODE);
} catch (PDOException $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
