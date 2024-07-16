USE Horario_EVJ;
-- normalizar los datos de una tabla no normalizada, obteniendo sus datos  e insertandolos en el esquema normalizado.

-- Insertar en la tabla Cursos
INSERT INTO Cursos (Nombre_de_Curso)
SELECT DISTINCT Nombre_de_Curso FROM Temp_Cursos;

-- Insertar en la tabla Secciones
INSERT INTO Secciones (Seccion)
SELECT DISTINCT Seccion FROM Temp_Cursos;

-- Insertar en la tabla Modalidades
INSERT INTO Modalidades (Modalidad)
SELECT DISTINCT Modalidad FROM Temp_Cursos;

-- Insertar en la tabla Edificios
INSERT INTO Edificios (Edificio)
SELECT DISTINCT Edificio FROM Temp_Cursos;

-- Insertar en la tabla Salones
INSERT INTO Salones (Salon, EdificioID)
SELECT DISTINCT Salon, e.EdificioID 
FROM Temp_Cursos t
JOIN Edificios e ON t.Edificio = e.Edificio;

-- Insertar en la tabla Horarios
INSERT INTO Horarios (Inicio, Final)
SELECT DISTINCT Inicio, Final FROM Temp_Cursos;

-- Insertar en la tabla Catedraticos
INSERT INTO Catedraticos (Nombre)
SELECT DISTINCT Catedratico FROM Temp_Cursos
WHERE Catedratico IS NOT NULL AND Catedratico <> '';

-- Insertar en la tabla Auxiliares
INSERT INTO Auxiliares (Nombre)
SELECT DISTINCT Auxiliar FROM Temp_Cursos
WHERE Auxiliar IS NOT NULL AND Auxiliar <> '';

-- Insertar en la tabla Curso_Seccion
INSERT INTO Curso_Seccion (CursoID, SeccionID, ModalidadID, SalonID, HorarioID, CatedraticoID, AuxiliarID)
SELECT DISTINCT 
    c.CursoID,
    s.SeccionID,
    m.ModalidadID,
    sl.SalonID,
    h.HorarioID,
    ca.CatedraticoID,
    a.AuxiliarID
FROM Temp_Cursos t
JOIN Cursos c ON t.Nombre_de_Curso = c.Nombre_de_Curso
JOIN Secciones s ON t.Seccion = s.Seccion
JOIN Modalidades m ON t.Modalidad = m.Modalidad
JOIN Salones sl ON t.Salon = sl.Salon
JOIN Edificios e ON t.Edificio = e.Edificio
JOIN Horarios h ON t.Inicio = h.Inicio AND t.Final = h.Final
LEFT JOIN Catedraticos ca ON t.Catedratico = ca.Nombre
LEFT JOIN Auxiliares a ON t.Auxiliar = a.Nombre;

-- Selects 
Select * from Catedraticos;
Select * from Auxiliares;
Select * from Secciones;
Select * from Modalidades;

--creacion de proceso para obtener cursos mediante la hora de inicio
DELIMITER //

CREATE PROCEDURE ObtenerCursosPorHoraInicio(IN HoraInicio TIME)
BEGIN
    SELECT 
        c.Nombre_de_Curso,
        s.Seccion,
        m.Modalidad,
        e.Edificio,
        sa.Salon,
        h.Inicio,
        h.Final,
        cat.Nombre AS Catedratico,
        aux.Nombre AS Auxiliar
    FROM 
        Curso_Seccion cs
    JOIN 
        Cursos c ON cs.CursoID = c.CursoID
    JOIN 
        Secciones s ON cs.SeccionID = s.SeccionID
    JOIN 
        Modalidades m ON cs.ModalidadID = m.ModalidadID
    JOIN 
        Salones sa ON cs.SalonID = sa.SalonID
    JOIN 
        Edificios e ON sa.EdificioID = e.EdificioID
    JOIN 
        Horarios h ON cs.HorarioID = h.HorarioID
    LEFT JOIN 
        Catedraticos cat ON cs.CatedraticoID = cat.CatedraticoID
    LEFT JOIN 
        Auxiliares aux ON cs.AuxiliarID = aux.AuxiliarID
    WHERE 
        h.Inicio = HoraInicio;
END //

DELIMITER ;

-- llamar al proceso creado anteriormente
CALL ObtenerCursosPorHoraInicio('07:00:00');
