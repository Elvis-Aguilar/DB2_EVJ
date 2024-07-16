-- Base de datos de los horarios de escuela de vacaciones no normalizados
CREATE DATABASE Horario_EVJ;
USE Horario_EVJ;

-- Tabla temporal, donde se obtendran los datos para normalizarlos, a esta tabla se le insertaran los datos del excel.
CREATE TABLE Temp_Cursos(
    Nombre_de_Curso VARCHAR(500),
    Seccion VARCHAR(50),
    Modalidad VARCHAR(50),
    Edificio VARCHAR(50),
    Salon VARCHAR(50),
    Inicio TIME,
    Final TIME,
    Catedratico VARCHAR(255),
    Auxiliar VARCHAR(255)
);

SELECT * FROM Temp_Cursos;
--TRUNCATE table Temp_Cursos;