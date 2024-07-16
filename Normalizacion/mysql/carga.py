import pandas as pd
import mysql.connector
import numpy as np

# Ruta del archivo Excel
excel_file = '/home/elvis/DocumentosPersonales/docuentos U/2024-primer-semestre/EV-Junio-Bases2-Capital/DB2_EVJ/Web-Scraping/Horarios.xlsx'

# Leer el archivo Excel
df = pd.read_excel(excel_file)

# Reemplazar los valores nan con None
df.replace({np.nan: None}, inplace=True)

# Conexión a MySQL
conn = mysql.connector.connect(
   host='localhost',  
   user='root',  
   password='4056ELVIS',  
   database='Horario_EVJ'
)

cursor = conn.cursor()

# Insertar los datos en la tabla temporal
for index, row in df.iterrows():
    print("Valores a insertar:", row['Nombre_de_Curso'], row['Sección'], row['Modalidad'], row['Edificio'], row['Salon'], row['Inicio'], row['Final'], row['Catedrático'], row['Auxiliar'])

    cursor.execute("""
    INSERT INTO Temp_Cursos (Nombre_de_Curso, Seccion, Modalidad, Edificio, Salon, Inicio, Final, Catedratico, Auxiliar)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)""",
    (row['Nombre_de_Curso'], row['Sección'], row['Modalidad'], row['Edificio'], row['Salon'], row['Inicio'], row['Final'], row['Catedrático'], row['Auxiliar']))

conn.commit()
cursor.close()
conn.close()

print("Datos insertados exitosamente en la tabla temporal.")
