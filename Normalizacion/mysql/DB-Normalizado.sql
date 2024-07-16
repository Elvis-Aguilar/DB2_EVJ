-- Base de datos de los horarios normalizado
USE Horario_EVJ;

-- Tabla Catedraticos
CREATE TABLE Catedraticos (
    CatedraticoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255)
);

-- Tabla Auxiliares
CREATE TABLE Auxiliares (
    AuxiliarID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255)
);

-- Tabla Cursos
CREATE TABLE Cursos (
    CursoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_de_Curso VARCHAR(500)
);

-- Tabla Secciones
CREATE TABLE Secciones (
    SeccionID INT AUTO_INCREMENT PRIMARY KEY,
    Seccion VARCHAR(50)
);

-- Tabla Modalidades
CREATE TABLE Modalidades (
    ModalidadID INT AUTO_INCREMENT PRIMARY KEY,
    Modalidad VARCHAR(50)
);

-- Tabla Edificios
CREATE TABLE Edificios (
    EdificioID INT AUTO_INCREMENT PRIMARY KEY,
    Edificio VARCHAR(50)
);

-- Tabla Salones
CREATE TABLE Salones (
    SalonID INT AUTO_INCREMENT PRIMARY KEY,
    Salon VARCHAR(50),
    EdificioID INT,
    FOREIGN KEY (EdificioID) REFERENCES Edificios(EdificioID)
);

-- Tabla Horarios
CREATE TABLE Horarios (
    HorarioID INT AUTO_INCREMENT PRIMARY KEY,
    Inicio TIME,
    Final TIME
);

-- Tabla Curso_Seccion (Relaci�n entre Cursos y Secciones con detalles adicionales)
CREATE TABLE Curso_Seccion (
    Curso_SeccionID INT AUTO_INCREMENT PRIMARY KEY,
    CursoID INT,
    SeccionID INT,
    ModalidadID INT,
    SalonID INT,
    HorarioID INT,
    CatedraticoID INT,
    AuxiliarID INT,
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID),
    FOREIGN KEY (SeccionID) REFERENCES Secciones(SeccionID),
    FOREIGN KEY (ModalidadID) REFERENCES Modalidades(ModalidadID),
    FOREIGN KEY (SalonID) REFERENCES Salones(SalonID),
    FOREIGN KEY (HorarioID) REFERENCES Horarios(HorarioID),
    FOREIGN KEY (CatedraticoID) REFERENCES Catedraticos(CatedraticoID),
    FOREIGN KEY (AuxiliarID) REFERENCES Auxiliares(AuxiliarID)
);
