<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

$host = 'localhost';
$dbname = 'reservation_system';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $user, $pass);
    $stmt = $pdo->query("SELECT * FROM tour_list ORDER BY reviews_rating DESC");
    $tours = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($tours);
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
