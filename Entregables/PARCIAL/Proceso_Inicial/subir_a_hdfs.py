import os
import re
import unicodedata
import subprocess
import pandas as pd

# === CONFIGURACIÓN ===
KEY_PATH = r"C:\Users\Lenovo\.ssh\horton_id_rsa"
LOCAL_DIR = r"C:\Inteligencia_Negocios\Archivos\Descargados"
REMOTE_DIR = "/root/hdfs_upload"
HDFS_DIR = "/data/raw/"
SSH_CONN = "root@127.0.0.1"
SSH_PORT = "2222"

# === CREAR LISTA DE ARCHIVOS ===
files = [
    "CIE10_2021.csv",
    "Datos-planeamiento-estrategico.xlsx",
    "DF_ExLab_CExt_Diabetes.csv",
    "DF_ExLab_CExt_EnfermedadRenal.csv",
    "DF_ExLab_CExt_Hiperlipidemia.csv",
    "ipress.xls",
]


# === FUNCIÓN PARA LIMPIAR NOMBRES ===
def limpiar_nombre(nombre):
    # Normaliza tildes y ñ
    nfkd = unicodedata.normalize("NFKD", nombre)
    sin_tildes = "".join([c for c in nfkd if not unicodedata.combining(c)])
    # Reemplaza espacios por _
    sin_espacios = sin_tildes.replace(" ", "_")
    # Elimina cualquier otro carácter raro
    limpio = re.sub(r"[^A-Za-z0-9._-]", "", sin_espacios)
    return limpio


# === CONVERTIR EXCEL A CSV ===
print("📄 Convirtiendo archivos Excel a CSV...")
converted_files = []
for f in files:
    path = os.path.join(LOCAL_DIR, f)
    if f.endswith((".xls", ".xlsx")):
        print(f" -> {f}")
        xls = pd.ExcelFile(path)
        for sheet in xls.sheet_names:
            df = pd.read_excel(xls, sheet_name=sheet)
            clean_sheet = limpiar_nombre(sheet)
            new_name = limpiar_nombre(f"{os.path.splitext(f)[0]}_{clean_sheet}.csv")
            new_path = os.path.join(LOCAL_DIR, new_name)
            df.to_csv(new_path, index=False)
            converted_files.append(new_name)
            print(f"    |-> Hoja '{sheet}' -> {new_name}")
    else:
        converted_files.append(f)


# === COPIAR ARCHIVOS A LA VM ===
print("\n🚚 Copiando archivos a la VM (sandbox)...")
subprocess.run(
    ["ssh", "-p", SSH_PORT, "-i", KEY_PATH, SSH_CONN, f"mkdir -p {REMOTE_DIR}"],
    check=True,
)

for f in converted_files:
    local_path = os.path.join(LOCAL_DIR, f)
    print(f"→ Subiendo {f}")
    subprocess.run(
        [
            "scp",
            "-P",
            SSH_PORT,
            "-i",
            KEY_PATH,
            local_path,
            f"{SSH_CONN}:{REMOTE_DIR}/",
        ],
        check=True,
    )

# === CREAR CARPETA EN HDFS Y SUBIR ARCHIVOS ===
print("\n📦 Subiendo archivos al HDFS...")
cmd_create_dir = f"hdfs dfs -mkdir -p {HDFS_DIR}"
cmd_put = f'for f in {REMOTE_DIR}/*; do hdfs dfs -put -f "$f" {HDFS_DIR}; done'

subprocess.run(
    ["ssh", "-p", SSH_PORT, "-i", KEY_PATH, SSH_CONN, cmd_create_dir], check=True
)
subprocess.run(["ssh", "-p", SSH_PORT, "-i", KEY_PATH, SSH_CONN, cmd_put], check=True)

print("\n✅ ¡Archivos subidos correctamente a HDFS en /data/raw/!")
