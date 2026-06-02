<?php
// ========================================
// TEST DE CODIFICACIÓN DE CARACTERES
// ========================================

require_once __DIR__ . '/api/config.php';

try {
    $pdo = getPDO();
    
    echo "<meta charset='UTF-8'>\n";
    echo "<h2>Verificación de Codificación UTF-8</h2>\n";
    echo "<hr>\n";
    
    // Verificar codificación de la conexión
    $charsetStmt = $pdo->query("SHOW VARIABLES LIKE 'character_set%'");
    echo "<h3>Configuración de Character Set:</h3>\n";
    echo "<pre>\n";
    while ($row = $charsetStmt->fetch()) {
        echo $row['Variable_name'] . ": " . $row['Value'] . "\n";
    }
    echo "</pre>\n";
    
    // Verificar alumnos
    echo "<h3>Alumnos Insertados (Verificación UTF-8):</h3>\n";
    echo "<table border='1' cellpadding='10' style='border-collapse: collapse;'>\n";
    echo "<tr><th>No. Control</th><th>Nombre Completo</th><th>Especialidad</th><th>Semestre</th></tr>\n";
    
    $stmt = $pdo->query(
        "SELECT a.numero_control, a.nombre_completo, e.nombre as especialidad, a.semestre_actual
         FROM alumnos a
         LEFT JOIN especialidades e ON e.id = a.especialidad_id
         WHERE a.numero_control LIKE '2024%'
         ORDER BY a.numero_control"
    );
    
    while ($row = $stmt->fetch()) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($row['numero_control']) . "</td>";
        echo "<td>" . htmlspecialchars($row['nombre_completo']) . "</td>";
        echo "<td>" . htmlspecialchars($row['especialidad']) . "</td>";
        echo "<td>" . htmlspecialchars($row['semestre_actual']) . "</td>";
        echo "</tr>\n";
    }
    echo "</table>\n";
    
    $countStmt = $pdo->query("SELECT COUNT(*) as total FROM alumnos WHERE numero_control LIKE '2024%'");
    $count = $countStmt->fetch();
    echo "<hr>\n<p><strong>Total de alumnos nuevos: " . $count['total'] . "</strong></p>\n";
    
} catch (Exception $e) {
    echo "Error: " . htmlspecialchars($e->getMessage());
}
?>
