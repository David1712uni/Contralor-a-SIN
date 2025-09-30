--1. DF_ExLab_CExt_Hipertension
DROP TABLE IF EXISTS df_exlab_cext_hipertension;
CREATE EXTERNAL TABLE df_exlab_cext_hipertension (
  fecha_corte STRING,
  departamento STRING,
  provincia STRING,
  distrito STRING,
  ubigeo STRING,
  red STRING,
  ipress STRING,
  id_paciente STRING,
  edad_paciente INT,
  sexo_paciente STRING,
  edad_medico INT,
  id_medico STRING,
  cod_diag STRING,
  diagnostico STRING,
  area_hospitalaria STRING,
  servicio_hospitalario STRING,
  actividad_hospitalaria STRING,
  fecha_muestra STRING,
  fec_resultado_1 STRING,
  procedimiento_1 STRING,
  resultado_1 STRING,
  unidades_1 STRING,
  fec_resultado_2 STRING,
  procedimiento_2 STRING,
  resultado_2 STRING,
  unidades_2 STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\073'
STORED AS TEXTFILE
LOCATION '/Data/DF_ExLab_CExt_Hipertension/'
TBLPROPERTIES ("skip.header.line.count"="1");

--2. DF_ExLab_CExt_Obesidad
DROP TABLE IF EXISTS df_exlab_cext_obesidad;
CREATE EXTERNAL TABLE df_exlab_cext_obesidad (
  fecha_corte STRING,
  departamento STRING,
  provincia STRING,
  distrito STRING,
  ubigeo STRING,
  red STRING,
  ipress STRING,
  id_paciente STRING,
  edad_paciente INT,
  sexo_paciente STRING,
  edad_medico INT,
  id_medico STRING,
  cod_diag STRING,
  diagnostico STRING,
  area_hospitalaria STRING,
  servicio_hospitalario STRING,
  actividad_hospitalaria STRING,
  fecha_muestra STRING,
  fec_resultado_1 STRING,
  procedimiento_1 STRING,
  resultado_1 STRING,
  unidades_1 STRING,
  fec_resultado_2 STRING,
  procedimiento_2 STRING,
  resultado_2 STRING,
  unidades_2 STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\073'
STORED AS TEXTFILE
LOCATION '/Data/DF_ExLab_CExt_Obesidad/'
TBLPROPERTIES ("skip.header.line.count"="1");

--3. DF_ExLab_CExt_Diabetes
DROP TABLE IF EXISTS df_exlab_cext_diabetes;
CREATE EXTERNAL TABLE df_exlab_cext_diabetes (
  fecha_corte STRING,
  departamento STRING,
  provincia STRING,
  distrito STRING,
  ubigeo STRING,
  red STRING,
  ipress STRING,
  id_paciente STRING,
  edad_paciente INT,
  sexo_paciente STRING,
  edad_medico INT,
  id_medico STRING,
  cod_diag STRING,
  diagnostico STRING,
  area_hospitalaria STRING,
  servicio_hospitalario STRING,
  actividad_hospitalaria STRING,
  fecha_muestra STRING,
  fec_resultado_1 STRING,
  procedimiento_1 STRING,
  resultado_1 STRING,
  unidades_1 STRING,
  fec_resultado_2 STRING,
  procedimiento_2 STRING,
  resultado_2 STRING,
  unidades_2 STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\073'
STORED AS TEXTFILE
LOCATION '/Data/DF_ExLab_CExt_Diabetes/'
TBLPROPERTIES ("skip.header.line.count"="1");

--4. CIE10
DROP TABLE IF EXISTS cie10;
CREATE EXTERNAL TABLE cie10 (
  codigo STRING,
  descripcion STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/Data/CIE10_2021/'
TBLPROPERTIES ("skip.header.line.count"="1");

--5. geodir_ubigeo_inei
DROP TABLE IF EXISTS geodir_ubigeo_inei;
CREATE EXTERNAL TABLE geodir_ubigeo_inei (
  ubigeo STRING,
  distrito STRING,
  provincia STRING,
  departamento STRING,
  poblacion STRING,
  superficie STRING,
  y STRING,
  x STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\073'
STORED AS TEXTFILE
LOCATION '/Data/geodir_ubigeo_inei/'
TBLPROPERTIES ("skip.header.line.count"="1");

--6. planeamiento_estrategico_ubigeo
DROP TABLE IF EXISTS planeamiento_estrategico_ubigeo;
CREATE EXTERNAL TABLE planeamiento_estrategico_ubigeo (
  ubigeo STRING,
  poblacion_total_2007 STRING,
  poblacion_total_2017 STRING,
  poblacion_total_2020 STRING,
  poblacion_menores1_2017 STRING,
  poblacion_mayores80_2020 STRING,
  poblacion_discapacidad_2020 STRING,
  superficie_km2 STRING,
  densidad_2020 STRING,
  capital_legal STRING,
  altitud_msnm STRING,
  latitud_sur STRING,
  longitud_oeste STRING,
  tipologia_distrito STRING,
  centro_funcional STRING,
  numero_provincias STRING,
  numero_distritos STRING,
  numero_centros_poblados STRING,
  pais_fronterizo STRING,
  poblacion_menores1_censo2017 STRING,
  nacidos_vivos_2020 STRING,
  nacidos_bajo_peso_2020 STRING,
  porc_bajo_peso_2020 STRING,
  porc_dni_menores1_2021 STRING,
  ivia_2018 STRING,
  porc_desnutricion_2020 STRING,
  porc_anemia_2020 STRING,
  porc_exceso_peso_2020 STRING,
  distritos_meta4 STRING,
  ide_2017 STRING,
  centros_salud_mental_2021 STRING,
  camara_comercio STRING,
  sedes_senati_2021 STRING,
  mercados_abastos_2016 STRING,
  idh_2019 STRING,
  porc_pobreza_total STRING,
  num_pobres STRING,
  porc_pobreza_extrema STRING,
  num_pobreza_extrema STRING,
  poblacion_ocupada_2007 STRING,
  poblacion_ocupada_2017 STRING,
  devengado_pc_actividad_2020 STRING,
  devengado_pc_inversion_2020 STRING,
  devengado_pc_total_2020 STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\073'
STORED AS TEXTFILE
LOCATION '/Data/Planeamiento_Estrategico_Ubigeo_utf8/'
TBLPROPERTIES ("skip.header.line.count"="1");
