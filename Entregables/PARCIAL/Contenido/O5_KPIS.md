# 5. KPI’S Y FICHAS TÉCNICAS DE INDICADORES

## 5.1. Catálogo de KPI’s

| **KPI** | **Propósito principal** |
|----------|--------------------------|
| **Promedio general anual de resultados** | Evaluar la evolución global de los valores promedio (p. ej., glucosa) para medir el impacto de políticas de salud a largo plazo. |
| **Variación porcentual anual del promedio de resultados** | Identificar tendencias de mejora o empeoramiento interanual y orientar decisiones de planificación sanitaria nacional o regional. |
| **Proporción de casos con complicaciones** | Medir la gravedad de los casos diagnosticados y la efectividad de las estrategias preventivas a nivel macro. |
| **Índice de concentración por grupo etario (HHI)** | Detectar desigualdades o concentraciones de riesgo en determinados grupos poblacionales para definir políticas de prevención. |
| **Tasa de diagnósticos por grupo etario** | Focalizar intervenciones en los grupos más afectados y orientar campañas de detección temprana. |
| **Departamento con mayor carga de diagnósticos** | Priorizar recursos y acciones sanitarias en las regiones con mayor incidencia. |
| **Promedio de resultado por tipo de enfermedad** | Evaluar diferencias en el control según el tipo de diabetes y ajustar protocolos clínicos. |
| **Departamento con mejor control promedio** | Identificar buenas prácticas regionales y replicarlas en otras zonas con peor desempeño. |
| **Distribución mensual de diagnósticos** | Detectar estacionalidad o picos mensuales para ajustar recursos operativos (personal, campañas, insumos). |

---

## 5.2. Fichas técnicas de indicadores

### A. Promedio general de resultado por año

| **Campo** | **Descripción** |
|------------|----------------|
| **Nombre del KPI** | Promedio general de resultado por año |
| **Definición** | Mide la tendencia anual de los valores promedio de resultado |
| **Fórmula** | Promedio(resultado de exámenes) agrupado por año |
| **Unidad** | Valor promedio por año |
| **Frecuencia** | Anual |
| **Fuente de datos** | Datos Abiertos EsSalud, INEI |
| **Responsable** | Unidad de Estadística Médica |

---

### B. Tasa de diagnósticos por grupo etario

| **Campo** | **Descripción** |
|------------|----------------|
| **Nombre del KPI** | Tasa de diagnósticos por grupo etario |
| **Definición** | Indica qué grupo etario concentra más diagnósticos |
| **Fórmula** | (Cantidad de diagnósticos / Total de diagnósticos) × 100 |
| **Unidad** | % del total de casos |
| **Frecuencia** | Mensual |
| **Fuente de datos** | Datos Abiertos EsSalud |
| **Responsable** | Coordinación Epidemiológica |

---

### C. Departamento con mayor carga de diagnósticos

| **Campo** | **Descripción** |
|------------|----------------|
| **Nombre del KPI** | Departamento con mayor carga de diagnósticos |
| **Definición** | Identifica la región más afectada |
| **Fórmula** | Suma(cantidad de diagnósticos) por región |
| **Unidad** | Nº de diagnósticos |
| **Frecuencia** | Mensual |
| **Fuente de datos** | Datos Abiertos EsSalud, Ubigeo INEI |
| **Responsable** | Gerencias Regionales |

---

### D. Variación porcentual anual del promedio de resultados

| **Campo** | **Descripción** |
|------------|----------------|
| **Nombre del KPI** | Variación porcentual anual del promedio de resultados |
| **Definición** | Mide si los niveles promedio de la enfermedad mejoran o empeoran cada año |
| **Fórmula** | (Promedio año actual - Promedio año anterior) / Promedio año anterior × 100 |
| **Unidad** | % de variación |
| **Frecuencia** | Mensual |
| **Fuente de datos** | Datos Abiertos EsSalud |
| **Responsable** | Dirección de Prevención |

---

### E. Promedio de resultado por tipo de diabetes

| **Campo** | **Descripción** |
|------------|----------------|
| **Nombre del KPI** | Promedio de resultado por tipo de diabetes |
| **Definición** | Permite detectar si ciertos tipos presentan peores valores |
| **Fórmula** | Promedio de resultado por enfermedad |
| **Unidad** | Valor promedio |
| **Frecuencia** | Mensual |
| **Fuente de datos** | Datos hospitalarios |
| **Responsable** | Coordinación de Control Médico |

---

### F. Distribución mensual de diagnósticos

| **Campo** | **Descripción** |
|------------|----------------|
| **Nombre del KPI** | Distribución mensual de diagnósticos |
| **Definición** | Detecta estacionalidad o picos en diagnósticos |
| **Fórmula** | Total (cantidad de diagnósticos) |
| **Unidad** | Nº de diagnósticos por mes |
| **Frecuencia** | Mensual |
| **Fuente de datos** | Datos Abiertos EsSalud |
| **Responsable** | Unidad de Estadística |

---

### G. Promedio ponderado de resultados por cantidad de diagnósticos

| **Campo** | **Descripción** |
|------------|----------------|
| **Nombre del KPI** | Promedio ponderado de resultados por cantidad de diagnósticos |
| **Definición** | Integra la gravedad promedio considerando el peso de cada registro |
| **Fórmula** | Σ(promedio resultado × cantidad diagnósticos) / Σ(cantidad diagnósticos) |
| **Unidad** | Valor ponderado |
| **Frecuencia** | Mensual |
| **Fuente de datos** | Datos Abiertos EsSalud |
| **Responsable** | Dirección de Epidemiología |

---

### H. Departamento con mejor control promedio

| **Campo** | **Descripción** |
|------------|----------------|
| **Nombre del KPI** | Departamento con mejor control promedio |
| **Definición** | Identifica la región con mejores valores promedio de control |
| **Fórmula** | Mínimo(promedio resultado) |
| **Unidad** | Valor más bajo promedio |
| **Frecuencia** | Mensual |
| **Fuente de datos** | RRHH EsSalud, RENIPRESS |
| **Responsable** | Jefatura de Recursos Humanos |

---

### I. Proporción de casos con complicaciones

| **Campo** | **Descripción** |
|------------|----------------|
| **Nombre del KPI** | Proporción de casos con complicaciones |
| **Definición** | Evalúa la gravedad de los diagnósticos según si hay complicaciones |
| **Fórmula** | (Casos con “complicación” / Total de casos) × 100 |
| **Unidad** | % de casos complicados |
| **Frecuencia** | Mensual |
| **Fuente de datos** | RENIPRESS, Datos Abiertos EsSalud |
| **Responsable** | Gerencias de Red |

---

### J. Índice de concentración por grupo etario

| **Campo** | **Descripción** |
|------------|----------------|
| **Nombre del KPI** | Índice de concentración por grupo etario |
| **Definición** | Mide si los diagnósticos están concentrados en un grupo etario o distribuidos |
| **Fórmula** | Σ((cantidad diagnósticos grupo / total diagnósticos)²) |
| **Unidad** | Índice (0 = disperso, 1 = concentrado) |
| **Frecuencia** | Mensual |
| **Fuente de datos** | Datos Abiertos EsSalud, Ubigeo INEI |
| **Responsable** | Dirección Estratégica |

---

## 5.3. Jerarquía de KPI’s y semáforos

### Jerarquía de KPI’s

| **Nivel** | **KPI** | **Propósito principal** |
|------------|----------|--------------------------|
| **Estratégico** | 1. Promedio general anual de resultados | Evaluar la evolución global de los valores promedio (p. ej., glucosa) para medir el impacto de políticas de salud a largo plazo. |
| **Estratégico** | 4. Variación porcentual anual del promedio de resultados | Identificar tendencias de mejora o empeoramiento interanual y orientar decisiones de planificación sanitaria nacional o regional. |
| **Estratégico** | 9. Proporción de casos con complicaciones | Medir la gravedad de los casos diagnosticados y la efectividad de las estrategias preventivas a nivel macro. |
| **Estratégico** | 10. Índice de concentración por grupo etario (HHI) | Detectar desigualdades o concentraciones de riesgo en determinados grupos poblacionales. |
| **Táctico** | 2. Tasa de diagnósticos por grupo etario | Focalizar intervenciones en los grupos más afectados y orientar campañas de detección temprana. |
| **Táctico** | 3. Departamento con mayor carga de diagnósticos | Priorizar recursos y acciones sanitarias en las regiones con mayor incidencia. |
| **Táctico** | 5. Promedio de resultado por tipo de enfermedad | Evaluar diferencias en el control según el tipo de diabetes y ajustar protocolos clínicos. |
| **Táctico** | 8. Departamento con mejor control promedio | Identificar buenas prácticas regionales y replicarlas en otras zonas con peor desempeño. |
| **Operativo** | 6. Distribución mensual de diagnósticos | Detectar estacionalidad o picos mensuales para ajustar recursos operativos. |
| **Operativo** | 7. Promedio ponderado de resultados | Monitorear el desempeño global considerando el peso real de cada registro. |

---

### Tabla de semáforos de KPI’s

| **KPI** | **Unidad** | **Óptimo** | **Moderado** | **Crítico** | **Meta** | **Interpretación** |
|----------|-------------|-------------|---------------|-------------|-----------|--------------------|
| Promedio general anual de resultados | mg/dL | ≤ 150 | 151–180 | >180 | ≤150 | Evalúa el control promedio de los pacientes a nivel nacional o regional. |
| Tasa de diagnósticos por grupo etario | % del total de casos | <25% por grupo | 25%–40% | >40% | Distribución equilibrada | Indica concentración de casos en un grupo etario; valores altos implican población de riesgo dominante. |
| Departamento con mayor carga de diagnósticos | Nº de diagnósticos | <15% del total nacional | 15%–25% | >25% | ≤15% | Mide la concentración geográfica de casos; altos valores indican sobrecarga regional. |
| Variación porcentual anual del promedio de resultados | % | ≤0% (mejora) | 0–5% | >5% | ≤0% | Mide la tendencia de control de la enfermedad año a año; positivo indica empeoramiento. |
| Promedio de resultado por tipo de enfermedad | mg/dL | ≤160 | 161–180 | >180 | ≤160 | Compara control promedio entre tipos de diabetes; altos valores implican mayor severidad. |
| Distribución mensual de diagnósticos | Nº de casos | <10% variación mensual | 10%–20% | >20% | ≤10% | Detecta estacionalidad o brotes; alta variabilidad sugiere picos de incidencia. |
| Promedio ponderado de resultados | mg/dL | ≤150 | 151–180 | >180 | ≤150 | Refleja el control general considerando el peso de los casos. |
| Departamento con mejor control promedio | mg/dL | ≤140 | 141–160 | >160 | ≤140 | Indica la región con mejores resultados promedio. |
| Proporción de casos con complicaciones | % de casos | ≤10% | 11%–20% | >20% | ≤10% | Evalúa la gravedad de los casos; valores altos alertan sobre falta de control o diagnóstico tardío. |
| Índice de concentración por grupo etario (HHI) | Índice (0–1) | ≤0.20 | 0.21–0.40 | >0.40 | ≤0.20 | Mide la concentración de diagnósticos; valores altos indican concentración en pocos grupos. |
