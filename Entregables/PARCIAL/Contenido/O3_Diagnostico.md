# 3. DIAGNÓSTICO Y DEFINICIÓN DE PROBLEMAS

## 3.1. Identificación de problemas de negocio

### 3.1.1. Análisis FODA

#### **Fortalezas**
- **Datos históricos institucionales de atenciones (emergencias, hospitalizaciones):** Base para construir modelos predictivos que permitan anticipar picos de demanda.  
- **Investigación previa en EsSalud sobre modelos predictivos para demanda en emergencias:** Uso de algoritmos que podrían integrarse con análisis de demanda futura.  
- **Procesos normados de distribución de camas hospitalarias:** Manuales internos que pueden optimizarse para prever la distribución de camas según demanda anticipada.  
- **Soluciones digitales para el asegurado:** Potencial para integrar plataformas de monitoreo y gestión en tiempo real.  
- **Presencia de una red nacional de establecimientos:** Facilita redistribuir carga y mejorar la capacidad de respuesta ante picos.  
- **Médicos altamente especializados y comprometidos:** Permite optimizar recursos humanos, esenciales ante incrementos de demanda.  

#### **Debilidades**
- **Falta de sistematización e integración de datos históricos asistenciales:** Los datos están disgregados y carecen de interoperabilidad.  
- **Baja cultura institucional de planificación predictiva:** Predomina la respuesta reactiva ante la demanda.  
- **Recursos humanos rígidos:** Dificultad para ajustarse rápidamente a incrementos de demanda.  
- **Procesos de asignación de camas no anticipatorios:** Basados en respuesta reactiva, no preventiva.  
- **Escasez presupuestal:** Limita la capacidad para mantener recursos ociosos ante picos de demanda.  
- **Infraestructura y equipamiento médico deficiente:** Dificulta respuesta rápida en situaciones críticas.  

#### **Oportunidades**
- **Uso de técnicas de series temporales y machine learning:** Modelos como ARIMA/SARIMA para predecir picos de demanda.  
- **Cooperación con entidades académicas:** Desarrollo de modelos de demanda oculta y proyectada.  
- **Impulso del gobierno para la transformación digital:** Creación de herramientas predictivas nacionales.  
- **Crecimiento económico del país:** Oportunidad de captar financiamiento para infraestructura y anticipación de demanda.  
- **Crecimiento de la población urbana:** Incrementa la urgencia de contar con estrategias predictivas.  

#### **Amenazas**
- **Eventos inesperados (epidemias, desastres):** Ponen a prueba la capacidad de anticipación.  
- **Incremento sostenido de demanda en emergencias:** Ejemplo: Hospital Almenara, esperas de hasta 96 h por falta de camas.  
- **Violaciones de datos y ciberataques:** Riesgo para seguridad y confianza en modelos predictivos.  
- **Brecha digital en la población:** Limita acceso equitativo a servicios digitales.  
- **Restricciones legales y normativas:** Pueden limitar inversión en tecnologías de anticipación.  
- **Injerencia de terceros en la gestión institucional:** Afecta la capacidad de respuesta rápida.  

> **Conclusión del FODA:**  
> Uno de los puntos críticos identificados es la incapacidad institucional para anticipar la demanda y garantizar recursos (camas, personal, herramientas) con suficiente margen ante picos de atención.

---

### 3.1.2. Problemas detectados

#### **1. Incapacidad para anticipar la demanda de emergencias y hospitalizaciones**
- **Descripción:** Los registros históricos no se usan para modelar la demanda futura.  
- **Implicancia:** Saturación de recursos ante demandas inesperadas.  
- **Consecuencia:** Pacientes esperan hasta 96 horas por falta de camas (ej. Hospital Almenara).  

#### **2. Falta de reserva o capacidad extra para responder a picos de demanda**
- **Descripción:** No existe capacidad “ociosa controlada” (camas, personal, herramientas).  
- **Implicancia:** Ante picos, se recurre a medidas improvisadas.  
- **Consecuencia:** Saturación, retrasos y deterioro de la calidad de atención.  

#### **3. Insuficiente planificación de recursos humanos ajustada a demanda proyectada**
- **Descripción:** Programación de personal basada en históricos, no en proyecciones.  
- **Implicancia:** Falta de personal en momentos críticos.  
- **Consecuencia:** Sobrecarga laboral y tiempos de espera prolongados.  

#### **4. Planificación de insumos basada en consumo histórico sin proyección de demanda oculta**
- **Descripción:** Adquisiciones basadas solo en consumos previos, sin considerar demanda latente (20–30 % adicional).  
- **Implicancia:** Desabastecimiento en escenarios de alta demanda.  
- **Consecuencia:** Suspensión de procedimientos y fallas en la gestión.  

#### **5. Sistemas de información fragmentados**
- **Descripción:** Los datos de emergencias, hospitalización y recursos están en sistemas no integrados.  
- **Implicancia:** No se puede visualizar ni anticipar el uso global de recursos.  
- **Consecuencia:** Decisiones reactivas e ineficientes.  

---

## 3.2. Priorización de problemas

| Problema | Impacto en la misión | Esfuerzo para resolver | Prioridad |
|-----------|------------------------------------------|-------------------------|------------|
| Incapacidad para anticipar demanda de emergencias / hospitalizaciones | Muy alto | Alto | Alta |
| Falta de capacidad de reserva para picos | Alto | Medio-Alto | Media-Alta |
| Programación de personal no ajustada | Medio-Alto | Medio | Media |
| Planificación de insumos con márgenes insuficientes | Medio | Medio | Media |
| Sistemas de información fragmentados | Medio-Alto | Alto | Alta |

---

## 3.3. Filtrado de problemas

Para validar la viabilidad del enfoque de **anticipar demanda**, es necesario filtrar y verificar:

- Existencia de historiales digitales de atenciones con granularidad diaria/horaria.  
- Accesibilidad de datos de ocupación, egresos, rotación y tiempos de estancia.  
- Existencia de algoritmos de predicción previos.
- Presupuesto disponible para capacidad ociosa mínima.  
- Viabilidad organizativa, legal y técnica para integrar sistemas hospitalarios.  

Solo los problemas que superen este filtro (disponen de datos, control institucional y margen de acción) se pasarán a formulación **SMART**.

---

## 3.4. Planteamiento de problemas con criterios SMART

### **A) Problema SMART A**
> “Para diciembre de 2026, EsSalud debe implementar un sistema predictivo (usando series temporales) en al menos 5 hospitales de nivel III, de modo que pueda anticipar la demanda de emergencias con al menos 85 % de exactitud y permitir activar con 48 horas de anticipación la movilización de camas y personal de soporte.”

- **Específico:** Predicción de demanda en emergencias.  
- **Medible:** 85 % de exactitud, activación con 48 h.  
- **Alcanzable:** Con modelos ARIMA/SARIMA ya probados.  
- **Relevante:** Evita saturaciones mediante anticipación.  
- **Tiempo:** Diciembre de 2026.  

---

### **B) Problema SMART B**
> “Durante el período 2025–2027, EsSalud incrementará su capacidad de reserva hospitalaria en un 15 % (camas, unidades de soporte, personal en reserva) para responder a picos de demanda no anticipados, con activaciones automáticas basadas en predicción.”

- **Específico:** Capacidad de reserva basada en predicción.  
- **Medible:** +15 %.  
- **Alcanzable:** Mediante inversiones y planificación progresiva.  
- **Relevante:** Reduce saturaciones en picos.  
- **Tiempo:** 2025–2027.  

---

### **C) Problema SMART C**
> “Para mediados de 2026, la programación del personal médico y de enfermería en hospitales de alta demanda estará alineada con pronósticos semanales generados por sistema predictivo, de modo que al menos el 90 % de turnos críticos estén cubiertos durante semanas de alta demanda proyectada.”

- **Específico:** Programación de personal con pronóstico semanal.  
- **Medible:** 90 % de cobertura de turnos críticos.  
- **Alcanzable:** Si el sistema predictivo es preciso.  
- **Relevante:** Asegura disponibilidad de recursos humanos.  
- **Tiempo:** Mitad de 2026.  

---

### **D) Problema SMART D**
> “Para fines de 2026, los hospitales pilotos integrarán sus sistemas de información (emergencia, hospitalización, camas libres) y generarán reportes automáticos diarios de pronóstico de demanda, permitiendo identificar cada madrugada el riesgo de saturación en las siguientes 48 horas.”

- **Específico:** Integración de sistemas y generación de pronósticos.  
- **Medible:** Reporte diario con riesgo a 48 h.  
- **Alcanzable:** Con arquitectura de datos, ETL/APIs.  
- **Relevante:** Brinda visión anticipada para decisiones operativas.  
- **Tiempo:** Fines de 2026.  
