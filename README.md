# Proyecto de Gestión Académica y Comercial

## 📄 Descripción
Este proyecto gestiona dos bases de datos: **Universitaria** y **Tienda**, diseñadas para manejar datos de alumnos, profesores, asignaturas, grados y productos, fabricantes, y ventas. Permite realizar consultas complejas para análisis tanto académicos como comerciales.

### Características
1. **Conexión a la base de datos:**
    - Conexión mediante MySQL para manejar ambas bases de datos.
2. **Creación de tablas:**
    - **Universitaria:**
        - Personas (alumnos y profesores).
        - Departamentos.
        - Asignaturas.
        - Cursos y matriculación.
    - **Tienda:**
        - Productos.
        - Fabricantes.
        - Ventas.
3. **Consultas:**
    - Consultas de datos académicos, como alumnos matriculados, profesores asignados a departamentos, y asignaturas.
    - Consultas comerciales sobre productos, fabricantes y ventas.
4. **Relaciones:**
    - Relación entre alumnos, asignaturas, y cursos.
    - Relación entre productos y fabricantes.
    - Relación entre ventas y productos.
5. **Análisis:**
    - Consultas sobre matriculaciones, créditos de asignaturas y distribución de productos y ventas.

---

## 💻 Tecnologías Utilizadas
- **MySQL**
- **IDE recomendado:** IntelliJ IDEA o cualquier IDE compatible con SQL.

---

## 📊 Requisitos
- **MySQL:** Servidor en funcionamiento.
- **Acceso a las bases de datos Universitaria y Tienda.**

---

## 🛠️ Instalación
1. Clona este repositorio:
   ```bash
   git clone S2.02.-MySQL-Queries-S2.02
   
---

## 🔧 Ejecución
1. Asegúrate de tener las bases de datos configuradas correctamente en MySQL.
2. Ejecuta las consultas del archivo universidad_queries.sql para obtener la información deseada de las bases de datos.
3. Verifica que las tablas y datos se han creado correctamente y que las consultas devuelven resultados coherentes.

---

## ✨ Características Adicionales
El modelo es escalable y permite agregar futuras funcionalidades como:
- Análisis de rendimiento académico.
- Reportes sobre ventas y productos.
- Consultas avanzadas de gestión académica y comercial.

---

## 📢 Notas
Si tienes problemas:
- Revisa que el servidor MySQL esté activo.
- Verifica la configuración de las credenciales en `Conexion`.
- Comprueba los logs para errores en la ejecución de las consultas.

---

© 2024. Proyecto desarrollado por Ezequiel Macchi Seoane.
