<?php

/**
 * dijkstra.php
 *
 * Реализация алгоритма Дейкстры для поиска кратчайшего маршрута в графе.
 * Используется в проекте для расчета оптимального пути между двумя станциями метро.
 *
 * 🔧 Требования:
 * - PHP >= 7.0
 * - Файл db.php для подключения к базе данных
 * - Таблицы со станциями и связями в БД (см. metro.sql)
 *
 * 📥 Входные данные:
 * - Стартовая станция (string)
 * - Конечная станция (string)
 *
 * 📤 Выходные данные:
 * - Массив с кратчайшим маршрутом и расстоянием
 *
 * 🧠 Как работает:
 * - Загружает граф станций из базы данных
 * - Создает очередь с приоритетами (на основе расстояния от начальной станции)
 * - Постепенно находит кратчайшие расстояния до всех узлов
 * - Восстанавливает путь от конечной станции назад к начальной
 *
 * 📦 Используется в: route.php
 */

require_once 'db.php';

function buildGraph(PDO $pdo): array {
    $graph = [];

    $edges = $pdo->query("SELECT station_id1, station_id2, time, travel_time FROM connections")->fetchAll();
    foreach ($edges as $edge) {
        $time = (float)$edge['travel_time'];
        $graph[$edge['station_id1']][$edge['station_id2']] = $time;
        $graph[$edge['station_id2']][$edge['station_id1']] = $time;
    }

    return $graph;
}

function dijkstra(array $graph, int $start, int $end): array {
    $dist = [];
    $prev = [];
    $queue = [];

    foreach ($graph as $vertex => $edges) {
        $dist[$vertex] = INF;
        $prev[$vertex] = null;
        $queue[$vertex] = true;
    }

    $dist[$start] = 0;

    while (!empty($queue)) {
        // Найти вершину с минимальной дистанцией
        $minDist = INF;
        $minVertex = null;
        foreach ($queue as $vertex => $_) {
            if ($dist[$vertex] < $minDist) {
                $minDist = $dist[$vertex];
                $minVertex = $vertex;
            }
        }

        if ($minVertex === null) break;
        unset($queue[$minVertex]);

        if ($minVertex == $end) break;

        foreach ($graph[$minVertex] as $neighbor => $weight) {
            $alt = $dist[$minVertex] + $weight;
            if ($alt < $dist[$neighbor]) {
                $dist[$neighbor] = $alt;
                $prev[$neighbor] = $minVertex;
            }
        }
    }

    // Восстановить путь
    $path = [];
    for ($u = $end; $u !== null; $u = $prev[$u]) {
        array_unshift($path, $u);
    }

    if ($path[0] != $start) return []; // путь не найден

    return $path;
}
