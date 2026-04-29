# Modelo de Sistema de Archivos - ISTEA

Este repositorio contiene una estructura jerárquica de directorios diseñada para prácticas de **Administración de Sistemas Operativos**, **Gestión de Almacenamiento** e **Infraestructura**. 

El objetivo de este modelo es simular un entorno empresarial real para ejecutar pruebas de permisos (ACLs), cuotas de disco, scripts de automatización y organización de activos digitales.

## 📂 Estructura del Directorio

A continuación se detalla la finalidad de cada rama del filesystem:

### 1. 📁 `/Archivos`
Destinado al almacenamiento de datos en bruto o archivos temporales de procesamiento.

### 2. 📁 `/Documentos`
Estructura organizada para la gestión documental administrativa.
* **`/Formato`**: Contiene plantillas oficiales, hojas de estilo y documentos base para la creación de nuevos archivos.
* **`/Homologados`**: Repositorio de documentos que han pasado un proceso de revisión y cuentan con aprobación oficial.
* **`/Logs`**: Directorio crítico para la trazabilidad. Aquí se almacenan los registros de eventos de sistema o aplicaciones vinculadas a la gestión de documentos.

### 3. 📁 `/Listas`
Espacio dedicado a archivos de texto plano, CSV o bases de datos ligeras que contienen listados (usuarios, inventarios, procesos).

### 4. 📁 `/PDF`
Repositorio histórico y de solo lectura de documentos finalizados, organizado por año fiscal o lectivo para facilitar la rotación de backups.
* **`/2023`**, **`/2024`**, **`/2025`**, **`/2026`**: Subcarpetas para la segregación temporal de archivos PDF.

### 5. 📁 `/Proyectos`
El núcleo operativo del modelo, dividido por el origen o destino del trabajo.
* **`/Clientes`**: Información, entregables y configuraciones específicas para cuentas externas.
* **`/Internos`**: Desarrollo de herramientas propias, documentación de infraestructura y proyectos de mejora del equipo.

---

## 📊 Visualización del Árbol (Tree)



```bash
ISTEA
├── Archivos
├── Documentos
│   ├── Formato
│   ├── Homologados
│   └── Logs
├── Listas
├── PDF
│   ├── 2023
│   ├── 2024
│   ├── 2025
│   └── 2026
└── Proyectos
    ├── Clientes
    └── Internos
