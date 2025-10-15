# 9. DISEÑO DEL PROCESO ETL / ELT

## 9.1. Diagrama de flujo ETL

**Flujo general del proceso:**

**Extract → Transform → Load**

1. **Extract:**  
   - Se extraen los datos desde archivos CSV cargados al sistema.  
   - Se realiza limpieza básica (eliminación de nulos, verificación de delimitadores y esquema).

2. **Transform:**  
   - Conversión de fechas de *string* a tipo `date`.  
   - Cálculo del **grupo etario** a partir de la edad del paciente.  
   - Incorporación del **código de institución (`cod_institucion`)** en la tabla de diagnóstico.  

3. **Load:**  
   - Carga final en tablas del **Data Warehouse**, estructuradas en el modelo dimensional.

---

### Modelo de Tablas y Relaciones

| Tabla | Descripción | Clave primaria | Relaciones |
|--------|--------------|----------------|-------------|
| **Dim_Enfermedad (df_CIE)** | Catálogo CIE10 de enfermedades | `cod_enfermedad` | ↔ Diagnóstico |
| **Dim_Paciente (df_Paciente_final)** | Pacientes únicos | `id_paciente` | ↔ Diagnóstico |
| **Dim_Medico (df_Medico_final)** | Médicos únicos | `id_medico` | ↔ Diagnóstico |
| **Dim_Procedimiento (df_Procedimiento)** | Catálogo de exámenes y procedimientos | `cod_procedimiento` | ↔ Resultado_Procedimiento |
| **Dim_IPRESS (df_Ipress)** | Establecimientos de salud | `cod_institucion` | ↔ Diagnóstico |
| **Dim_Ubigeo (df_Geodir)** | Ubicación geográfica (departamento, provincia, distrito) | `ubigeo` | ↔ IPRESS, Diagnóstico |
| **Fact_Diagnostico (df_diagnostico)** | Registro principal de atención médica | `cod_diagnostico` | ↔ Todas las dimensiones |
| **Fact_Resultado_Procedimiento (df_Resultado_Procedimiento)** | Resultados de laboratorio | `(cod_diagnostico, cod_procedimiento)` | ↔ Diagnóstico y Procedimiento |

---

## 9.2. Zonas y tablas objetivo (*raw → curated*)

### Zona RAW — Datos Brutos

Contiene los datos originales extraídos directamente desde las fuentes (archivos CSV, APIs o bases externas).  
No se aplican transformaciones significativas, únicamente adaptación al formato compatible con el Data Lake (Parquet).  
Permite mantener un **histórico íntegro y trazable**.

| Tabla | Descripción | Ubicación |
|--------|--------------|-----------|
| `raw.diagnostico` | Diagnósticos médicos registrados con identificadores de paciente, médico e institución. | `/user/hive/warehouse/raw/diagnostico` |
| `raw.paciente` | Datos de pacientes, incluyendo edad y sexo. | `/user/hive/warehouse/raw/paciente` |
| `raw.resultado_procedimiento` | Resultados de procedimientos médicos realizados. | `/user/hive/warehouse/raw/resultado_procedimiento` |
| `raw.procedimiento` | Catálogo de procedimientos con descripción. | `/user/hive/warehouse/raw/procedimiento` |
| `raw.ipress` | Información de instituciones de salud (IPRESS). | `/user/hive/warehouse/raw/ipress` |
| `raw.ubigeo` | Ubicaciones geográficas: departamento, provincia, distrito. | `/user/hive/warehouse/raw/ubigeo` |
| `raw.CIE` | Clasificación de enfermedades según código CIE10. | `/user/hive/warehouse/raw/CIE` |

---

### Zona CURATED — Datos Depurados y Modelados

Contiene los datos transformados, limpios y enriquecidos, listos para análisis o modelos OLAP.  
Incluye campos derivados, conversiones de tipo y *joins* lógicos entre fuentes.

| Tabla | Descripción | Ubicación |
|--------|--------------|-----------|
| `curated.fact_diagnostico` | Tabla de hechos que consolida diagnóstico, paciente, procedimiento y localización. Particionada por departamento. | `/user/hive/warehouse/curated/fact_diagnostico` |

**Campos de la tabla `fact_diagnostico`:**

| Campo | Descripción |
|--------|--------------|
| `cod_diagnostico` | Identificador del diagnóstico |
| `id_paciente` | Código único del paciente |
| `sexo_paciente` | Género del paciente |
| `grupo_etario` | Grupo de edad calculado |
| `cod_institucion` | Código de la IPRESS |
| `nombre` | Nombre de la institución |
| `departamento` | Departamento del establecimiento |
| `red` | Red de salud correspondiente |
| `cod_enfermedad` | Código CIE10 de la enfermedad |
| `des_enfermedad` | Descripción de la enfermedad |
| `des_procedimiento` | Descripción del procedimiento |
| `resultado` | Resultado (positivo, negativo, etc.) |
| `unidades` | Unidades del procedimiento |
| `fecha_resultado` | Fecha del resultado del procedimiento |

---

## 9.3. Reglas de negocio y transformaciones clave

Durante el proceso ETL se aplicaron reglas de negocio y transformaciones para asegurar **calidad, consistencia y usabilidad**.

### A. Normalización de estructuras

- Homogeneización de nombres de columnas y tipos de datos entre fuentes.  
- Conversión de texto a mayúsculas uniformes (`upper()`).  
- Transformación de fechas: `string → date` (`yyyy-MM-dd`).

### B. Enriquecimiento de datos

- **Cálculo de grupo etario:**

| Rango de edad | Grupo etario asignado |
|----------------|------------------------|
| 0 – 11 años | Niño |
| 12 – 17 años | Adolescente |
| 18 – 29 años | Joven |
| 30 – 59 años | Adulto |
| 60+ años | Adulto Mayor |

- Inclusión de `cod_institucion` en diagnóstico (join con `df_ipress`).  
- Integración del catálogo CIE10 (`df_CIE`) para añadir `des_enfermedad`.

### C. Depuración y control de calidad

- Eliminación de registros nulos en campos críticos (`dropna`).  
- Eliminación de duplicados:

```python
df_fact = df_fact.dropDuplicates(["cod_diagnostico", "id_paciente", "fecha_resultado"])
```

### D. Validación de integridad referencial

- Validación de existencia de claves en sus tablas maestras.  
- Joins realizados en modo **left join** para preservar registros base de diagnóstico.

---

### E. Transformaciones finales

- Reordenamiento y selección de columnas clave.  
- Escritura en formato **Parquet** particionado:

```python
df_fact.write.mode("overwrite").partitionBy("departamento").parquet(
    "/user/hive/warehouse/curated/fact_diagnostico"
)
```

## 9.4. Estrategia de particionado y formato

Para optimizar rendimiento, almacenamiento y consultas analíticas en la zona Curated, se aplicó una estrategia de almacenamiento eficiente.

### A. Formato de almacenamiento: Parquet

**Ventajas:**

* Compresión columnar eficiente.

* Lectura selectiva de columnas (column pruning).

* Compatibilidad con Hive, Spark SQL y Presto.

* Esquemas estructurados y metadatos analíticos

### B. Estrategia de particionado

* Partición primaria: departamento, ya que:

* Es una dimensión geográfica natural.

* Facilita filtrado por región y lectura paralela.

* Mejora rendimiento al evitar escaneo completo.

### C. Ventajas esperadas
| Aspecto	| Beneficio |
|--------|--------------|
|Lectura selectiva	|Solo se cargan columnas requeridas|
|Filtrado por partición	|Lectura rápida por departamento|
|Almacenamiento optimizado	|Reducción significativa en disco|

## 9.5. Manejo de errores y reintentos (Dead-Letter Queue)

Se implementó una estrategia robusta de control de calidad y manejo de errores para garantizar integridad y trazabilidad de datos.

### 1. Detección de errores en Extract

**Validaciones al cargar CSV en Spark:**

* Archivos corruptos o delimitadores inválidos → try-except

* Columnas faltantes → validación de esquema (df.schema)

* Filas vacías o duplicadas → filtradas antes de la zona Raw

**Ejemplo:**

```python
try:
    df_diagnostico = spark.read.csv("/data/diagnostico.csv", header=True, inferSchema=True)
except Exception as e:
    with open("/user/hive/warehouse/logs/etl_errors.log", "a") as log:
        log.write(f"Error al cargar diagnostico.csv: {str(e)}\n")
```

### 2. Manejo de errores en Transform

* Conversión de tipos (to_date(), cast()) con control de errores.

* Registros con valores críticos nulos se envían a zona de cuarentena.

```python
df_errores = df_fact.filter(df_fact["resultado"].isNull())
df_errores.write.mode("append").parquet("/user/hive/warehouse/errors/fact_diagnostico_error")
df_fact = df_fact.dropna(subset=["resultado"])
```

### 3. Dead-Letter Queue (DLQ)

Estructura dedicada a registros rechazados sin interrumpir el flujo ETL.

```swift
/user/hive/warehouse/errors/
├── diagnostico_error/
├── paciente_error/
├── procedimiento_error/
```



