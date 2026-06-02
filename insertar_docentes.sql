-- ========================================
-- INSERCIÓN DE DOCENTES CON UTF-8 CORRECTO
-- ========================================

SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

USE siea_db;

-- ========================================
-- PASO 1: ELIMINAR DOCENTES MAL CODIFICADOS
-- ========================================
DELETE FROM docentes;

-- ========================================
-- PASO 2: INSERTAR DOCENTES CORRECTAMENTE
-- ========================================

-- PROGRAMACIÓN
INSERT INTO docentes (nombre_completo, email, telefono, especialidad, horario_disponibilidad, activo)
VALUES
('Ing. Pedro Jiménez Flores', 'pjimenez@docente.edu.mx', '6641234601', 'Programación', 'Lunes a Viernes 9:00-17:00', 1),
('Ing. Sofia Gómez Martínez', 'sgomez@docente.edu.mx', '6641234602', 'Programación', 'Lunes a Viernes 9:00-15:00', 1),
('Ing. Carlos Rodríguez Sánchez', 'crodriguez@docente.edu.mx', '6641234603', 'Programación', 'Martes a Viernes 10:00-18:00', 1);

-- ELECTRICIDAD
INSERT INTO docentes (nombre_completo, email, telefono, especialidad, horario_disponibilidad, activo)
VALUES
('Ing. Javier Bustamante Hernández', 'jbustamante@docente.edu.mx', '6641234604', 'Electricidad', 'Lunes a Viernes 8:00-16:00', 1),
('Ing. Arturo Díaz Flores', 'adiaz@docente.edu.mx', '6641234605', 'Electricidad', 'Lunes a Jueves 9:00-17:00', 1);

-- ADMINISTRACIÓN
INSERT INTO docentes (nombre_completo, email, telefono, especialidad, horario_disponibilidad, activo)
VALUES
('Lic. Fernando García López', 'fgarcia@docente.edu.mx', '6641234606', 'Administración', 'Lunes a Viernes 10:00-18:00', 1),
('Lic. Gabriela Morales Ruiz', 'gmorales@docente.edu.mx', '6641234607', 'Administración', 'Martes a Viernes 8:00-16:00', 1);

-- SOPORTE Y MANTENIMIENTO
INSERT INTO docentes (nombre_completo, email, telefono, especialidad, horario_disponibilidad, activo)
VALUES
('Ing. Roberto Castillo Vega', 'rcastillo@docente.edu.mx', '6641234608', 'Soporte y Mantenimiento', 'Lunes a Viernes 9:00-17:00', 1),
('Ing. Mauricio Sánchez Torres', 'msanchez@docente.edu.mx', '6641234609', 'Soporte y Mantenimiento', 'Lunes a Jueves 8:00-16:00', 1);

-- RECURSOS HUMANOS
INSERT INTO docentes (nombre_completo, email, telefono, especialidad, horario_disponibilidad, activo)
VALUES
('Lic. Patricia Navarro Cruz', 'pnavarro@docente.edu.mx', '6641234610', 'Recursos Humanos', 'Martes a Viernes 10:00-18:00', 1);

-- VENTAS
INSERT INTO docentes (nombre_completo, email, telefono, especialidad, horario_disponibilidad, activo)
VALUES
('Lic. Diana Vargas Silva', 'dvargas@docente.edu.mx', '6641234611', 'Ventas', 'Lunes a Viernes 9:00-17:00', 1);

-- MANTENIMIENTO AUTOMOTRIZ
INSERT INTO docentes (nombre_completo, email, telefono, especialidad, horario_disponibilidad, activo)
VALUES
('Ing. Héctor Ríos Campos', 'hrios@docente.edu.mx', '6641234612', 'Mantenimiento Automotriz', 'Lunes a Viernes 8:00-16:00', 1),
('Ing. Manuel Contreras Núñez', 'mcontreras@docente.edu.mx', '6641234613', 'Mantenimiento Automotriz', 'Martes a Jueves 9:00-17:00', 1);

-- ========================================
-- RESUMEN
-- ========================================
SELECT 'DOCENTES INSERTADOS CORRECTAMENTE' AS resultado;
SELECT COUNT(*) as total_docentes FROM docentes WHERE activo = 1;
SELECT especialidad, COUNT(*) as cantidad FROM docentes WHERE activo = 1 GROUP BY especialidad ORDER BY especialidad;
