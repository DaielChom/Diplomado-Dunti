# PROYECTO DUNTI - INSTALACION DE KOBOTOOLBOX   

Para la práctica del 8° Diplomado Dunti ofrecido por el grupo Geomática, yo [Daniel Patiño](https://github.com/DaielChom) actualmente estudiante de Ing. de Sistemas en la Universidad Industrial de Santander, decidí realizar como proyecto la búsqueda he instalación de una alternativa libre para el software ArcGIS Collector. Dicho proceso de búsqueda, selección, instalación y prueba está mejor documentado en el [documento final del proyecto](./documento_final.docx). 

### PROCESO DE DESARROLLO 

El proceso de desarrollo del proyecto, es decir, búsqueda y selección de la herramienta está debidamente documentado en los distintos informes que se presentaron durante el tiempo que se duró el diplomado. [Informes](./informes/) Al final se decidió optar por realizar una instalación de[Kobotoolbox](http://www.kobotoolbox.org/) en los servidores de Geomática 

### INSTALACION 

Como se puede ver en los informes se decide realizar una instalación de kobotoolbox mediante docker, siguiendo varias guías presentes en internet para este proceso. 

* [Guía GitHub](https://github.com/kobotoolbox/kobo-docker#setup-procedure) 
* [Guía Kobowiki](https://www.kobowiki.org/index.php?title=KoBo_Toolbox_on_a_standalone_server) 

La instalación se realizó en la dirección [10.1.90.19](http://10.1.90.19:8000) de la red interna de la Universidad Industrial de Santander. Como contenido extra se elaboró un [video](./videos/kobotoolbox_install.mp4) donde se muestra el proceso de instalación realizado. 

Hay que aclarar que la instalación del Docker de kobotoolbox presento un par de inconvenientes con las versiones de las distintas imágenes Docker, en especial con la imagen de kobocat.  

la instalación realizada en abril - 2018 con las siguientes imágenes. 

* kobocat: issue_222 
* rabit: lasted - después de issue_30 
* mongo: lasted - después de docker_local 
* kpi: lasted - después de 2.018.11a 
* postgres: lasted - después de temp-dev-env 
* nginx: lasted - después de docker_local 

**Nota:** imágenes de kobocat después de isue_222 a la fecha (Abril - 2018) presentan inconvenientes.  

Los cambios de lasted a issue_222 para kobocat se realizan en el archivo `docker-compose.yml` en la línea de `image` de la sección de `kobocat`, estos cambios deben hacerse antes de hacer pull. 

### FUNCIONAMIENTO 

También se realizó un [video](./videos/kobotoolbox_funcionamiento.mp4) mostrando las funcionalidades presentadas por Kobotoolbox, sin embargo, en línea se pueden encontrar varios videos de su funcionamiento. 

Para la recolección de datos mediante un dispositivo móvil, hay que instalar la aplicación [android de Kobotoolbox](https://play.google.com/store/apps/details?id=org.koboc.collect.android&hl=es_419) y configurarla con los datos de servidor y usuarios de la instalación realizada. 

### CREACION DE USUARIOS 

Como se puede ver en la [Guía Github](https://github.com/kobotoolbox/kobo-docker#setup-procedure) existen dos maneras de instalación de kobotoolbox. la instalación que se hizo en la UIS fue con el método local (usando http), lo que genera un inconveniente con la creacion de nuevos usuarios, como se documenta en el [issue 101](https://github.com/kobotoolbox/kobo-docker/issues/101). Sin embargo, este problema tiene una solución documentada en el issue 101, algo rudimentaria. La creación de usuario en la instalación de la UIS se maneja con el siguiente [notebook](./nuevos_usuarios.ipynb). 
