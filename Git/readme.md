# 🧩 Casos de Uso Práctico para Aprender Git & GitHub desde la Línea de Comandos

Este documento reúne una serie de ejercicios prácticos para introducir a los alumnos en el uso de **Git** y **GitHub** desde la terminal.  
El objetivo es que comprendan los conceptos básicos de control de versiones, aprendan comandos esenciales y practiquen con repositorios reales.

---

## 🔧 Requisitos Previos

- Sistema operativo Linux, macOS o Windows con WSL.
- Tener instalado **Git** (`sudo apt install git -y` o equivalente).
- Contar con una cuenta en **GitHub**.
- Tener configurado el nombre y correo de usuario:
  ```bash
  git config --global user.name "Tu Nombre"
  git config --global user.email "tu_correo@ejemplo.com"


🧠 Estructura de Aprendizaje

Cada caso práctico incluye:

Objetivo: Qué se busca aprender.

Comandos y pasos sugeridos.

Resultado esperado.

🧩 Caso 1: Verificar la instalación y configuración de Git

Objetivo: Comprobar que Git esté instalado correctamente y conocer su configuración actual.

git --version
git config --list

✅ Resultado esperado: Ver la versión de Git y la configuración del usuario.

🧩 Caso 2: Crear un repositorio local

Objetivo: Crear un repositorio desde cero.

mkdir mi_primer_repo
cd mi_primer_repo
git init

✅ Resultado esperado: Carpeta inicializada con Git (verás .git/ al ejecutar ls -a).

🧩 Caso 3: Crear el primer archivo y confirmar cambios

Objetivo: Aprender a agregar y confirmar (commit) un archivo.

echo "Hola mundo Git" > README.md
git status
git add README.md
git commit -m "Primer commit: agrega README.md"

✅ Resultado esperado: Un commit registrado con un mensaje descriptivo.

🧩 Caso 4: Conectar el repositorio local a GitHub

Objetivo: Enlazar un repositorio local con uno remoto.

git remote add origin https://github.com/usuario/mi_primer_repo.git
git remote -v

✅ Resultado esperado: Ver la URL del repositorio remoto configurado como origin.

🧩 Caso 5: Subir los cambios iniciales a GitHub

Objetivo: Aprender a empujar (push) el contenido al remoto.

git push -u origin main

✅ Resultado esperado: El repositorio aparece en GitHub con los archivos cargados.

🧩 Caso 6: Clonar un repositorio existente

Objetivo: Clonar un proyecto de GitHub en la computadora local.

git clone https://github.com/usuario/proyecto-ejemplo.git
cd proyecto-ejemplo

✅ Resultado esperado: Tener una copia local del repositorio.

🧩 Caso 7: Explorar el historial de cambios

Objetivo: Revisar el historial de commits.

git log
git log --oneline

✅ Resultado esperado: Lista de commits con mensajes y autores.

🧩 Caso 8: Crear una nueva rama

Objetivo: Trabajar en una versión paralela del proyecto.

git branch nueva-funcionalidad
git checkout nueva-funcionalidad

✅ Resultado esperado: Rama activa con un nuevo nombre.

🧩 Caso 9: Fusionar ramas (merge)

Objetivo: Combinar los cambios de una rama secundaria a la principal.

git checkout main
git merge nueva-funcionalidad

✅ Resultado esperado: Los cambios de la rama se integran en main.


🧩 Caso 10: Resolver conflictos de fusión

Objetivo: Practicar resolución manual de conflictos.

Generar un conflicto modificando la misma línea en dos ramas.

Ejecutar git merge y resolver el conflicto en el archivo marcado con <<<<<<<, =======, >>>>>>>.

Luego:
git add archivo_conflictivo
git commit

✅ Resultado esperado: Fusión completada correctamente.


🧩 Caso 11: Ignorar archivos con .gitignore

Objetivo: Excluir archivos temporales o innecesarios.
echo "*.log" > .gitignore
git add .gitignore
git commit -m "Agrega archivo .gitignore para logs"

✅ Resultado esperado: Los archivos .log no se subirán al repositorio.


🧩 Caso 12: Deshacer un cambio (reset y revert)

Objetivo: Aprender a revertir errores.
git log --oneline
git revert <hash_commit>

✅ Resultado esperado: Un nuevo commit que revierte los cambios del anterior.


🧩 Caso 13: Descargar actualizaciones del remoto (pull)

Objetivo: Sincronizar el repositorio local con GitHub.
git pull origin main

✅ Resultado esperado: Repositorio local actualizado.


🧩 Caso 14: Revisar diferencias entre commits

Objetivo: Comparar versiones.
git diff

✅ Resultado esperado: Ver las diferencias línea por línea entre versiones.


🧩 Caso 15: Etiquetar versiones (tags)

Objetivo: Marcar un punto importante del proyecto.
git tag -a v1.0 -m "Versión inicial estable"
git push origin v1.0

✅ Resultado esperado: Tag visible en GitHub.


🧩 Caso 16: Clonar y colaborar en un repositorio de un compañero (fork + pull request)

Objetivo: Simular trabajo colaborativo.

Hacer fork desde GitHub.

Clonar el fork:
git clone https://github.com/tu_usuario/el_repo_forkeado.git

Crear una nueva rama, modificar algo y subir:
git checkout -b mejora
git commit -am "Agrega mejora"
git push origin mejora

Crear un Pull Request desde la interfaz web.

✅ Resultado esperado: PR enviado y visible en el repositorio original.


🧩 Caso 17: Analizar el estado actual del repositorio

Objetivo: Saber en qué estado están los archivos.
git status

✅ Resultado esperado: Estado claro de los archivos modificados, agregados o pendientes.


🧩 Caso 18: Ver el resumen de contribuciones

Objetivo: Analizar quién hizo qué cambios.
git shortlog -sn

✅ Resultado esperado: Lista de autores y cantidad de commits.


🧩 Caso 19: Borrar archivos y confirmar los cambios

Objetivo: Practicar eliminación controlada.
git rm archivo_innecesario.txt
git commit -m "Elimina archivo innecesario"
git push

✅ Resultado esperado: Archivo eliminado tanto localmente como en GitHub.


🧩 Caso 20: Crear un alias útil para Git

Objetivo: Agilizar comandos frecuentes.
git config --global alias.s "status -s"
git s

✅ Resultado esperado: Nuevo alias funcional para abreviar git status.



📘 Con estos casos de uso, podrán:

Dominar los comandos esenciales de Git.

Comprender el flujo básico de trabajo con GitHub.

Practicar la colaboración y control de versiones en entornos reales.










































