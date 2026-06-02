-- ========================================
-- CORRECCIÓN COMPLETA DE CODIFICACIÓN
-- Alumnos antiguos + Materias
-- ========================================

SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

USE siea_db;

-- ========================================
-- PASO 1: LIMPIAR CALIFICACIONES ANTIGUAS
-- ========================================
DELETE FROM calificaciones WHERE alumno_id IN (
    SELECT id FROM alumnos WHERE numero_control NOT LIKE '2024%'
);

-- ========================================
-- PASO 2: LIMPIAR ALUMNOS ANTIGUOS
-- ========================================
DELETE FROM alumnos WHERE numero_control NOT LIKE '2024%';

-- ========================================
-- PASO 3: LIMPIAR MATERIAS ANTIGUAS
-- ========================================
DELETE FROM materias;

-- ========================================
-- PASO 4: REINSERTAR MATERIAS CORRECTAMENTE
-- ========================================
INSERT INTO materias (nombre, descripcion, especialidad_id, semestre, creditos, activa)
VALUES
-- Programación
('Programación I', 'Fundamentos de programación en Python', 5, 2, 5, 1),
('Programación II', 'Programación orientada a objetos', 5, 4, 5, 1),
('Estructura de Datos', 'Estructuras y algoritmos', 5, 4, 4, 1),
('Bases de Datos', 'Diseño y administración de BD', 5, 4, 4, 1),

-- Administración
('Administración General', 'Principios de administración', 8, 2, 4, 1),
('Gestión Empresarial', 'Gestión de empresas', 8, 4, 4, 1),

-- Electricidad
('Electrónica Básica', 'Fundamentos de electrónica', 10, 2, 4, 1),
('Circuitos Eléctricos', 'Análisis de circuitos', 10, 4, 4, 1),

-- Soporte y Mantenimiento
('Redes I', 'Fundamentos de redes', 6, 2, 4, 1),
('Mantenimiento de Equipos', 'Mantenimiento preventivo', 6, 4, 4, 1),

-- Ventas
('Marketing I', 'Fundamentos de marketing', 9, 2, 4, 1),
('Técnicas de Venta', 'Técnicas y estrategias de venta', 9, 4, 4, 1),

-- Recursos Humanos
('Gestión de RRHH', 'Administración de recursos humanos', 7, 2, 4, 1),

-- Mantenimiento Automotriz
('Motores I', 'Fundamentos de motores', 12, 2, 4, 1);

-- ========================================
-- PASO 5: REINSERTAR ALUMNOS ANTIGUOS
-- ========================================
INSERT INTO alumnos (numero_control, nombre_completo, fecha_nacimiento, email, telefono, seccion, especialidad_id, semestre_actual, activo)
VALUES
('1024001', 'Juan García López', '2004-05-15', 'jgarcia@email.com', '6641111111', 'A', 5, 4, 1),
('1024002', 'María Rodríguez Pérez', '2004-08-22', 'mrodriguez@email.com', '6641111112', 'A', 5, 4, 1),
('1024003', 'Carlos Martínez González', '2004-11-10', 'cmartinez@email.com', '6641111113', 'B', 10, 4, 1),
('1024004', 'Ana López García', '2005-02-18', 'alopez@email.com', '6641111114', 'B', 8, 4, 1),
('1024005', 'Roberto Sánchez Torres', '2005-06-25', 'rsanchez@email.com', '6641111115', 'A', 6, 4, 1),
('1024006', 'Sofía Díaz Ruiz', '2005-09-30', 'sdiaz@email.com', '6641111116', 'A', 9, 4, 1),
('1024007', 'Miguel Ángel Flores Cruz', '2005-03-14', 'mflores@email.com', '6641111117', 'B', 7, 4, 1),
('1024008', 'Laura Jiménez Morales', '2005-07-20', 'ljimenez@email.com', '6641111118', 'A', 12, 4, 1),
('1024009', 'Ricardo Castillo Vega', '2005-01-12', 'rcastillo@email.com', '6641111119', 'B', 5, 2, 1),
('1024010', 'Patricia Hernández Silva', '2005-04-28', 'phernandez@email.com', '6641111120', 'A', 10, 2, 1),
('1024011', 'Fernando Reyes Ramos', '2005-10-05', 'freyes@email.com', '6641111121', 'B', 8, 2, 1),
('1024012', 'Gabriela Vargas Luna', '2005-11-17', 'gvargas@email.com', '6641111122', 'A', 6, 2, 1),
('1024013', 'Javier Mendoza Núñez', '2004-12-23', 'jmendoza@email.com', '6641111123', 'B', 9, 2, 1);

-- ========================================
-- PASO 6: REINSERTAR CALIFICACIONES
-- ========================================
INSERT INTO calificaciones (alumno_id, materia_id, docente_id, calificacion, semestre, parcial)
VALUES
-- Juan García López (id: 14 - primer alumno antiguo)
((SELECT id FROM alumnos WHERE numero_control = '1024001'), (SELECT id FROM materias WHERE nombre = 'Programación II'), 1, 8.5, 4, 2),
((SELECT id FROM alumnos WHERE numero_control = '1024001'), (SELECT id FROM materias WHERE nombre = 'Estructura de Datos'), 1, 8.2, 4, 2),

-- María Rodríguez Pérez (id: 15)
((SELECT id FROM alumnos WHERE numero_control = '1024002'), (SELECT id FROM materias WHERE nombre = 'Programación II'), 1, 9.0, 4, 2),
((SELECT id FROM alumnos WHERE numero_control = '1024002'), (SELECT id FROM materias WHERE nombre = 'Bases de Datos'), 2, 8.8, 4, 2),

-- Carlos Martínez González (id: 16)
((SELECT id FROM alumnos WHERE numero_control = '1024003'), (SELECT id FROM materias WHERE nombre = 'Electrónica Básica'), 3, 8.7, 4, 2),
((SELECT id FROM alumnos WHERE numero_control = '1024003'), (SELECT id FROM materias WHERE nombre = 'Circuitos Eléctricos'), 3, 8.4, 4, 2),

-- Ana López García (id: 17)
((SELECT id FROM alumnos WHERE numero_control = '1024004'), (SELECT id FROM materias WHERE nombre = 'Administración General'), 4, 8.3, 4, 2),
((SELECT id FROM alumnos WHERE numero_control = '1024004'), (SELECT id FROM materias WHERE nombre = 'Gestión Empresarial'), 4, 8.1, 4, 2),

-- Roberto Sánchez Torres (id: 18)
((SELECT id FROM alumnos WHERE numero_control = '1024005'), (SELECT id FROM materias WHERE nombre = 'Redes I'), 5, 8.6, 4, 2),
((SELECT id FROM alumnos WHERE numero_control = '1024005'), (SELECT id FROM materias WHERE nombre = 'Mantenimiento de Equipos'), 5, 8.2, 4, 2);

-- ========================================
-- RESUMEN
-- ========================================
SELECT 'CORRECCIÓN DE CODIFICACIÓN COMPLETADA' AS resultado;
