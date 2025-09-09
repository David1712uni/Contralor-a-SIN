
# 📊 Proyecto - Grupo 2

## 🏢 Detalles Generales

**Empresa**: Contraloría General de la República  
**Área**: Subgerencia de Inversiones - Gestión de Proyectos  

**Integrantes del Grupo:**
- Andrade Saavedra, Navhi Giordano  
- Carhuas Romero, Jhon Jesus  
- Caruzo Cieza, David  


## 🏗️ Arquitectura Preliminar

### 🔹 Fuente de Datos


┌─────────────────────────────────────────────────────────────┐

│                  FUENTES DE DATOS (RAW INPUT)               │

│  - Archivos Excel descentralizados                         │

│  - Distintas entidades cargan sus propios formatos         │

│  - Sin relaciones entre ellos                              │

└─────────────────────────────────────────────────────────────┘

```

---

### 🔹 ETL / Ingesta Automatizada

```

┌─────────────────────────────────────────────────────────────┐

│                  ETL / INGESTA AUTOMATIZADA                 │

│  - Validación de formato y columnas                         │

│  - Extracción de datos relevantes                           │

│  - Registro de metadatos de origen                          │

└─────────────────────────────────────────────────────────────┘

```

---

### 🗄️ Almacenamiento

**Plataforma elegida:** `Data Lakehouse`  
*(Combina lo mejor de Data Lakes y Data Warehouses)*

---

### 🔸 Capa Medallion

#### 🥉 BRONZE LAYER (Raw Layer)
```

┌─────────────────────────────────────────────────────────────┐

│  - Datos crudos desde Excel (sin transformar)               │

│  - Se conserva estructura original                          │

│  - Se almacenan logs de carga y errores                     │

└─────────────────────────────────────────────────────────────┘

```

⬇️

#### 🥈 SILVER LAYER (Clean/Standardized)
```

┌─────────────────────────────────────────────────────────────┐

│  - Unión de archivos por campos clave (ID Proyecto, Fecha) │

│  - Estandarización de formatos (fechas, monedas, etc.)      │

│  - Enriquecimiento con catálogos (región, entidad, etc.)    │

│  - Eliminación de duplicados y validación de integridad     │

└─────────────────────────────────────────────────────────────┘

```

⬇️

#### 🥇 GOLD LAYER (Business / KPIs)
```

┌─────────────────────────────────────────────────────────────┐
│  - Agregación de datos por KPI                              │
│  - Indicadores por entidad, proyecto, región, estado        │
│  - Tablas para dashboards y reportes automatizados          │
│  - Estructura lista para análisis o exportación             │
└─────────────────────────────────────────────────────────────┘

```

---

## 📤 Consumo de Datos

- **Power BI**: Para dashboards visuales, tableros de control y reportes mensuales.
- **Aplicación Web (Node.js)**: Para consultas en tiempo real, alertas, gestión de indicadores y visualización de riesgos.

---

> ✅ Este diseño permite escalar fácilmente hacia analítica avanzada, alertas tempranas y control automatizado de proyectos de inversión.
```

---

¿Quieres que también lo convierta a PDF o Word?
