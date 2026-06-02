-- ========================================
-- CORRECCIÓN DE CODIFICACIÓN DE CARACTERES
-- ========================================

-- Establecer codificación UTF-8 para la conexión
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

USE siea_db;

-- ========================================
-- ELIMINAR REGISTROS MAL CODIFICADOS
-- ========================================
DELETE FROM alumnos WHERE numero_control LIKE '2024%';

-- ========================================
-- INSERTAR 20 ALUMNOS CON CODIFICACIÓN CORRECTA
-- ========================================

-- ALUMNOS - ADMINISTRACIÓN (id: 8)
INSERT INTO alumnos (numero_control, nombre_completo, fecha_nacimiento, email, telefono, seccion, especialidad_id, semestre_actual, activo)
VALUES
('2024101', 'María Fernanda García López', '2006-03-15', 'mfgarcia@gmail.com', '6641234567', 'A', 8, 2, 1),
('2024102', 'José Luis Ramírez Soto', '2006-07-22', 'jlramirez@hotmail.com', '6641234568', 'A', 8, 2, 1),
('2024103', 'Ana Patricia Morales Cruz', '2006-11-08', 'apmorales@outlook.com', '6641234569', 'B', 8, 4, 1);

-- ALUMNOS - SOPORTE Y MANTENIMIENTO (id: 6)
INSERT INTO alumnos (numero_control, nombre_completo, fecha_nacimiento, email, telefono, seccion, especialidad_id, semestre_actual, activo)
VALUES
('2024201', 'Carlos Eduardo Pérez Flores', '2006-01-20', 'ceperez@gmail.com', '6641234570', 'A', 6, 2, 1),
('2024202', 'Diana Laura Hernández Ruiz', '2006-05-18', 'dlhernandez@hotmail.com', '6641234571', 'A', 6, 2, 1),
('2024203', 'Roberto Miguel Torres Vega', '2006-09-25', 'rmtorres@gmail.com', '6641234572', 'B', 6, 4, 1);

-- ALUMNOS - PROGRAMACIÓN (id: 5)
INSERT INTO alumnos (numero_control, nombre_completo, fecha_nacimiento, email, telefono, seccion, especialidad_id, semestre_actual, activo)
VALUES
('2024301', 'Luis Fernando Castillo Méndez', '2006-02-14', 'lfcastillo@outlook.com', '6641234573', 'A', 5, 2, 1),
('2024302', 'Sofía Gabriela Rojas Santos', '2006-06-30', 'sgrojas@gmail.com', '6641234574', 'A', 5, 2, 1),
('2024303', 'Miguel Ángel Díaz Ortiz', '2006-10-12', 'madiaz@hotmail.com', '6641234575', 'B', 5, 4, 1),
('2024304', 'Valeria Alejandra Gómez Luna', '2006-12-05', 'vagomez@gmail.com', '6641234576', 'B', 5, 4, 1);

-- ALUMNOS - VENTAS (id: 9)
INSERT INTO alumnos (numero_control, nombre_completo, fecha_nacimiento, email, telefono, seccion, especialidad_id, semestre_actual, activo)
VALUES
('2024401', 'Andrea Melissa Vargas Silva', '2006-04-08', 'amvargas@outlook.com', '6641234577', 'A', 9, 2, 1),
('2024402', 'Jorge Alberto Salinas Ramos', '2006-08-17', 'jasalinas@gmail.com', '6641234578', 'A', 9, 2, 1),
('2024403', 'Karla Daniela Mendoza Reyes', '2006-11-23', 'kdmendoza@hotmail.com', '6641234579', 'B', 9, 4, 1);

-- ALUMNOS - RECURSOS HUMANOS (id: 7)
INSERT INTO alumnos (numero_control, nombre_completo, fecha_nacimiento, email, telefono, seccion, especialidad_id, semestre_actual, activo)
VALUES
('2024501', 'Ricardo Javier Martínez Ochoa', '2006-03-28', 'rjmartinez@gmail.com', '6641234580', 'A', 7, 2, 1),
('2024502', 'Patricia Elizabeth Navarro Cruz', '2006-07-15', 'penavarro@outlook.com', '6641234581', 'A', 7, 2, 1);

-- ALUMNOS - MANTENIMIENTO AUTOMOTRIZ (id: 12)
INSERT INTO alumnos (numero_control, nombre_completo, fecha_nacimiento, email, telefono, seccion, especialidad_id, semestre_actual, activo)
VALUES
('2024601', 'Fernando Alejandro Ríos Campos', '2006-01-10', 'farios@hotmail.com', '6641234582', 'A', 12, 2, 1),
('2024602', 'Oscar Daniel Moreno Guzmán', '2006-05-22', 'odmoreno@gmail.com', '6641234583', 'A', 12, 2, 1),
('2024603', 'Jesús Antonio Domínguez Peña', '2006-09-14', 'jadominguez@outlook.com', '6641234584', 'B', 12, 4, 1);

-- ALUMNOS - ELECTRICIDAD (id: 10)
INSERT INTO alumnos (numero_control, nombre_completo, fecha_nacimiento, email, telefono, seccion, especialidad_id, semestre_actual, activo)
VALUES
('2024701', 'Arturo Francisco Jiménez Lara', '2006-02-25', 'afjimenez@gmail.com', '6641234585', 'A', 10, 2, 1),
('2024702', 'Mario Alberto Contreras Núñez', '2006-06-18', 'macontreras@hotmail.com', '6641234586', 'A', 10, 2, 1),
('2024703', 'Héctor Manuel Aguilar Paredes', '2006-10-30', 'hmaguilar@outlook.com', '6641234587', 'B', 10, 4, 1);

SELECT 'ALUMNOS CORREGIDOS EXITOSAMENTE' AS resultado;
