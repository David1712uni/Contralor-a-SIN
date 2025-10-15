# 4. NECESIDADES DE INFORMACIÓN Y PREGUNTAS DE NEGOCIO

## 4.1. Necesidades por nivel de decisión (estratégico / táctico / operativo)

La anticipación de demanda afecta a toda la cadena de decisiones dentro de EsSalud.  
A continuación, se muestran los distintos niveles de decisión y los tipos de información requeridos:

| **Nivel** | **Tipo de decisiones** | **Necesidades de información / insumos requeridos** |
|------------|------------------------|------------------------------------------------------|
| **Estratégico** | • Definir políticas institucionales para reservas de capacidad hospitalaria.<br>• Aprobar inversiones en infraestructura, sistemas y tecnología predictiva.<br>• Establecer criterios de distribución de recursos entre regiones o redes. | • Proyecciones agregadas nacionales / regionales de demanda hospitalaria (camas, emergencias, internaciones).<br>• Modelos de demanda futura (series temporales, escenarios).<br>• Análisis costo-beneficio de mantener reservas.<br>• Benchmarking con organismos internacionales.<br>• Indicadores consolidados de ocupación y uso histórico de camas.<br>• Análisis de sensibilidad ante choques exógenos (epidemias, estacionales). |
| **Táctico** | • Planificación de recursos por hospitales o redes.<br>• Ajuste de dotaciones de personal y asignación de camas.<br>• Activación de reservas o medidas de contingencia.<br>• Priorización de mejoras en hospitales específicos. | • Pronósticos semanales/mensuales de ocupación por hospital.<br>• Niveles de camas libres/ocupadas.<br>• Indicadores de rotación de camas y días promedio de estancia.<br>• Datos de ingresos y egresos hospitalarios.<br>• Datos de personal (turnos, ausencias, capacidad ociosa).<br>• Proyección de consumo y stock de insumos.<br>• Alertas automáticas de riesgo de saturación. |
| **Operativo** | • Ajustes diarios de turnos, derivaciones o reasignaciones.<br>• Asignación diaria de camas.<br>• Gestión del flujo de pacientes en emergencias y hospitalización.<br>• Monitoreo en tiempo real del uso de recursos. | • Dashboard en tiempo real con camas disponibles/ocupadas.<br>• Listas de espera y backlog.<br>• Alertas inmediatas de congestión.<br>• Información sobre tasa de llegada de pacientes y frecuencia de ingresos emergentes.<br>• Estado actual de insumos críticos.<br>• Disponibilidad del personal por turno. |

---

## 4.2. Inventario de preguntas de negocio (por área y prioridad)

A partir de los problemas priorizados (incapacidad de anticipar demanda, falta de reserva, planificación de personal, gestión de insumos y fragmentación de sistemas), se definen las **principales preguntas de negocio** que EsSalud deberá responder para diseñar soluciones.  
Las preguntas se agrupan por **área relevante** y **prioridad**:

| **Área / Dominio** | **Preguntas de negocio (prioritarias)** |
|---------------------|-----------------------------------------|
| **Demanda hospitalaria / camas** | 1. ¿Cuántas camas se necesitarán diariamente por hospital / red / región durante las próximas 1–4 semanas, con intervalo de confiabilidad ?<br>2. ¿Cuál es la tasa esperada de crecimiento de demanda de internaciones por especialidad (medicina interna, cirugía, UCI)?<br>3. ¿Cuál ha sido el patrón estacional o de brotes históricos en emergencias e ingresos hospitalarios?<br>4. ¿Cuántas camas de reserva deberían mantenerse para cubrir picos de demanda (porcentaje ideal)? |
| **Personal de salud / recursos humanos** | 5. ¿Cuál debe ser la dotación diaria óptima de médicos, enfermeras y personal de soporte según los pronósticos de demanda?<br>6. ¿Cuántos profesionales adicionales se requieren para manejar escenarios de alta demanda (reservas de personal)?<br>7. ¿Qué variabilidad en ausencias (enfermedad, permisos, rotación) se debe considerar?<br>8. ¿Cuántos turnos extra o personal de reemplazo se necesitan en escenarios de pico? |
| **Insumos y herramientas** | 9. ¿Qué volumen de insumos críticos (medicamentos, consumibles, reactivos, dispositivos) será requerido en el horizonte previsto?<br>10. ¿Cuál debe ser el nivel de stock de seguridad para cubrir picos imprevistos?<br>11. ¿Cuántos equipos de respaldo (ventiladores, bombas, monitores) se deben mantener disponibles?<br>12. ¿Cuáles son los cuellos de botella en la cadena de suministro de insumos según demanda prevista? |
| **Sistemas / datos / predicción** | 13. ¿Qué algoritmo de predicción (modelo estadístico o machine learning) ofrece mejor precisión para la demanda hospitalaria?<br>14. ¿Qué variables históricas (ingresos, estacionalidad, brotes, clima) son más predictivas?<br>15. ¿Qué grado de integración de datos (emergencia, hospitalización, camas, insumos) se requiere para alimentar el modelo en tiempo real?<br>16. ¿Cuál es el horizonte temporal óptimo de predicción (horas, días, semanas) para decisiones operativas o tácticas? |
| **Gestión estratégica / institucional** | 17. ¿Cuál es el costo estimado de mantener reservas de capacidad frente al costo de saturaciones?<br>18. ¿Cuál es el retorno en cobertura y calidad al anticipar demanda vs. reaccionar?<br>19. ¿Qué políticas institucionales deben emitirse para garantizar la adopción del modelo predictivo?<br>20. ¿En qué hospitales pilotos debe implementarse primero el sistema predictivo para su escalamiento? |

---

## 4.3. Traducción de preguntas en requisitos analíticos

Cada pregunta de negocio debe transformarse en un **requisito analítico**, definiendo los datos, métricas, modelos o dashboards necesarios para responderla.

| **Pregunta de negocio** | **Requisito analítico (qué construir)** |
|--------------------------|----------------------------------------|
| ¿Cuántas camas se necesitarán diariamente en las próximas semanas? | Modelo predictivo (serie temporal) por hospital/región que genere pronósticos diarios de demanda de camas con intervalos de confianza, integrados a un dashboard táctico. |
| ¿Cuál debe ser la dotación diaria de personal? | Dashboard que relacione pronóstico de demanda con ratios estándar de personal por paciente. |
| ¿Qué volumen de insumos críticos se requerirá? | Proyección de consumo de insumos por tipo de paciente multiplicada por la demanda prevista. Tabla mensual de requerimientos. |
| ¿Cuál debe ser el nivel de stock de seguridad? | Cálculo del stock de seguridad como porcentaje adicional sobre la demanda esperada más la variabilidad estimada. |
| ¿Qué algoritmo predictivo usar? | Evaluación comparativa de modelos con validación cruzada y métricas de error. |
| ¿Qué grado de integración de datos se requiere? | Diseño de arquitectura de datos: fuentes, canal ETL, base integrada y APIs con frecuencia de actualización definida. |
| ¿Cuál es el horizonte temporal óptimo de predicción? | Pruebas analíticas comparando precisión de pronósticos a 24 h, 48 h, 7 y 14 días, seleccionando el mejor equilibrio entre precisión y utilidad. |
| ¿Cuál es el costo/beneficio de reservas frente a saturaciones? | Modelo financiero comparativo de escenarios, evaluando costos adicionales y beneficios por reducción de saturaciones. |
| ¿En qué hospitales se implementará primero? | Análisis de priorización o clustering según variabilidad de demanda, tasas de saturación histórica y factibilidad técnica, para selección de pilotos. |

---