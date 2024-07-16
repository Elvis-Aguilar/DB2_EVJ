#  Normalizacion de una base de datos, con tabal ya existente
Practica para normalizar una base de datos, con una tabla que contiene los horarios de escuela de vacaciones, todo en una sola tabla, se normaliza y se extraen los datos de esa tabla para llenar las otras.

- Diagrama


 <img src="/Normalizacion/Normalizaion-tabla-existente.png" title="HTML5" alt="HTML" width="120" height="120"/>&nbsp;

- Nota: este mismo ejemplo se realiza para sql-Server asi como Mysql.

## 👨‍💻 Explicacion
Archivos ubicados en sus respectivas carpetas.

- paso 0: ingresar a su RBDMS (mysql/sql-server) o sistema gestor (interfaz) mysql workbench.

- paso 1: realizar la extraccion de los datos en un excel, con la tecnica de <<web scraping>> octoparse

- paso 2: Crear la base de datos "Horario_EVJ" con una tabla no noramlizada y sus tablas noramlizadas. 

**Script:** DB-No-Normalizado.sql 
**Script:** DB-Normalizado.sql 

- paso 3: ejecutar el programa para la insercion de un excel a la tabla creada.

**programa (Python):** carga.py

Asegurese de tener todas las librerias instaladas.

```bash
    pip install pandas
    pip install mysql-connector-python
    pip install numpy
```
version con arch

```bash
    sudo pacman -S python-openpyxl
    sudo pacman -S python-numpy
    sudo pacman -S python-mysql-connector
    sudo pacman -S python-pandas
```
**Ejecucion**

```bash
    python3 carga.py
```

- paso 4: Obtener los datos de la tabla no normalizada a las tablas normalizadas, ejectuar el script. 

**Script:** Normalizacion-Datos.sql

- Paso 5: ejectuar el predimiento para comprobar los datos de las tablas: mismo se encuentra en el script anterior