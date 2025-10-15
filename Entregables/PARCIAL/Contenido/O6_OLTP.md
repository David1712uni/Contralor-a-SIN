# 6. FUENTES DE DATOS Y INVENTARIO OLTP

## 6.1. Inventario de sistemas OLTP

El inventario de fuentes **OLTP** tiene como propósito identificar y documentar los sistemas transaccionales internos o externos que generan los **datos crudos esenciales** para alimentar los modelos de análisis y predicción en **EsSalud**.

Esto incluye conocer qué sistema captura cada tipo de dato (por ejemplo, consultas externas, codificación diagnóstica, infraestructura hospitalaria), qué unidad usuaria lo emplea, qué tipo de datos almacena (maestro o transaccional), la tecnología usada para su gestión, con qué frecuencia se actualiza y cualquier observación relevante (latencia, fiabilidad, dependencia, etc.).

Este inventario es la base para diseñar las **conexiones, extracciones (ETL/ELT), controles de calidad de datos** y los procesos de integración que permitirán que los modelos predictivos (por ejemplo, de demanda hospitalaria) cuenten con datos **consistentes, oportunos y verificables**.

| **Sistema** | **Área usuaria** | **Tipo** | **Tecnología** | **Frecuencia de actualización** | **Observaciones** |
|--------------|------------------|-----------|----------------|--------------------------------|--------------------|
| Sistema de Planeamiento Estratégico – CEPLAN | Planeamiento Estratégico y Estadística | Maestro / referencia geográfica | Archivo XLS | Anual / Semestral (actualizan planes y ubigeos) | Incluye descripciones y metadatos de cada ubigeo; sirve como insumo referencial para consolidar datos de salud y otras áreas del Estado. |
| Sistema de Consultas Externas – Datos Abiertos EsSalud | Red hospitalaria / Consulta externa | Transaccional (registros médicos de atenciones y diagnósticos) | Archivos CSV | Diario | Incluye registros de exámenes de laboratorio en consultas externas con diagnóstico de diabetes, hipertensión y obesidad (2020–2024). |
| Sistema de Codificación Geográfica – Ubigeo (INEI) | Planeamiento / Estadística | Maestro (catálogo) | Archivo CSV | Eventual / según necesidad | Contiene códigos y descripciones de distrito, provincia y departamento; se usa como referencia estándar para enlazar datos de salud con ubicación geográfica oficial. |
| Sistema de Clasificación Internacional de Enfermedades – CIE10 | Áreas médicas / Estadística | Maestro | Archivo CSV | Eventual / según necesidad | Contiene el código y descripción de enfermedades según la Clasificación Internacional de Enfermedades (CIE-10). |

---

## 6.2. Tipos de datos y formatos (CSV, JSON, BD relacional, APIs)

Para los sistemas incluidos en la sección **6.1**, los formatos y tipos de datos empleados (según fuentes oficiales) son los siguientes:

- **Archivos XLS / Excel:** usados para sistemas maestros de referencia como CEPLAN y RENIPRESS.  
- **Archivos CSV:** empleados en los sistemas de consulta externa (Datos Abiertos EsSalud) y catálogos maestros como Ubigeo e ICD-10.  
  En particular, el portal de **Datos Abiertos EsSalud** publica series históricas de *Atenciones en consulta externa* en formato CSV.  
- **Sistemas transaccionales clínicos:** EsSalud utiliza el sistema **ESSI (Servicio de Salud Inteligente)** para la historia clínica digital, que almacena datos de atenciones, exámenes, diagnósticos y prescripciones.  
- **Plataforma BI / reporte:** EsSalud dispone de **Explora EsSalud**, una plataforma de *business intelligence* para generación de tableros y reportes dinámicos.

---

## 6.3. Conectividad y consideraciones de seguridad / accesos

Basado en la información oficial de EsSalud y políticas públicas, las principales consideraciones son:

- El sistema **ESSI** se implementó para digitalizar la historia clínica en establecimientos de EsSalud, garantizando transmisión segura entre módulos internos.  
- Los **datos abiertos publicados** (p. ej. exámenes de laboratorio de patologías crónicas) provienen del ESSI y se publican en formato CSV para transparencia.  
- La implementación de ESSI busca asegurar la **confidencialidad, integridad y disponibilidad** de los datos clínicos, permitiendo acceso controlado por parte de profesionales.  
- Los accesos internos a sistemas clínicos deben gestionarse con **permisos y controles de usuario**.  
- El consumo de datos desde la plataforma **BI (Explora)** debe hacerse mediante mecanismos de **extracción controlada y segura** (réplicas, conexiones autorizadas) para no afectar el rendimiento del sistema transaccional.  
- Las **publicaciones de datos abiertos** requieren **anonimización o eliminación de datos sensibles** para cumplir con las normas de privacidad.

---

## 6.4. Volúmenes estimados y frecuencia de actualización

Dado que los sistemas OLTP en la tabla 6.1 son principalmente **catálogos maestros o conjuntos de datos abiertos** (no sistemas clínicos en tiempo real), los volúmenes y frecuencias son moderados:

- **Sistema de Planeamiento – CEPLAN:** actualización anual o semestral; volumen pequeño (catálogos geográficos).  
- **Sistema de Consultas Externas – Datos Abiertos EsSalud:** contiene miles o decenas de miles de registros históricos; se actualiza **diariamente** desde ESSI hacia la plataforma de datos abiertos.  
- **Sistema de Codificación Geográfica – Ubigeo (INEI):** actualización eventual ante cambios administrativos; volumen bajo.  
- **Sistema CIE10:** actualización eventual según versión oficial; volumen moderado.  
- **RENIPRESS:** sistema de infraestructura nacional; actualización ocasional cuando se modifican los establecimientos afiliados.

---