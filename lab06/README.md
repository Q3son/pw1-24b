<div align="center">
<table>
    <theader>
        <tr>
            <td><img src="https://github.com/rescobedoq/pw2/blob/main/epis.png?raw=true" alt="EPIS" style="width:50%; height:auto"/></td>
            <th>
                <span style="font-weight:bold;">UNIVERSIDAD NACIONAL DE SAN AGUSTIN</span><br />
                <span style="font-weight:bold;">FACULTAD DE INGENIERÍA DE PRODUCCIÓN Y SERVICIOS</span><br />
                <span style="font-weight:bold;">DEPARTAMENTO ACADÉMICO DE INGENIERÍA DE SISTEMAS E INFORMÁTICA</span><br />
                <span style="font-weight:bold;">ESCUELA PROFESIONAL DE INGENIERÍA DE SISTEMAS</span>
            </th>
            <td><img src="https://github.com/rescobedoq/pw2/blob/main/abet.png?raw=true" alt="ABET" style="width:50%; height:auto"/></td>
        </tr>
    </theader>
    <tbody>
        <tr><td colspan="3"><span style="font-weight:bold;">Formato</span>: Guía de Práctica de Laboratorio</td></tr>
        <tr><td><span style="font-weight:bold;">Aprobación</span>:  2022/03/01</td><td><span style="font-weight:bold;">Código</span>: GUIA-PRLD-001</td><td><span style="font-weight:bold;">Página</span>: 1</td></tr>
    </tbody>
</table>
</div>

<div align="center">
<span style="font-weight:bold;">GUÍA DE LABORATORIO</span><br />
</div>


<table>
<theader>
<tr><th colspan="6">INFORMACIÓN BÁSICA</th></tr>
</theader>
<tbody>
<tr><td>ASIGNATURA:</td><td colspan="5">Programación Web </td></tr>
<tr><td>TÍTULO DE LA PRÁCTICA:</td><td colspan="5">Ejemplo Unificado y Archivo de Universidades Licenciadas</td></tr>
<tr>
<td>NÚMERO DE LABORATORIO:</td><td>06</td><td>AÑO LECTIVO:</td><td>2024 B</td><td>NRO. SEMESTRE:</td><td>II</td>
</tr>
<tr>
<td>FECHA INICIO::</td><td>29-Octubre-2024</td><td>FECHA FIN:</td><td>17-Noviembre-2024</td><td>DURACIÓN:</td><td>12 horas</td>
</tr>
<tr><td colspan="6">RECURSOS:
    <ul>
        <li><a href="https://www.perlenespanol.com/tutoriales/">https://www.perlenespanol.com/tutoriales/</a></li>
        <li><a href="https://www.w3schools.com/">https://www.w3schools.com/</a></li>        
        <li><a href="https://www.w3schools.com/css/default.asp">https://www.w3schools.com/css/default.asp</a></li>
        <li><a href="https://www.w3schools.com/html/default.asp">https://www.w3schools.com/html/default.asp</a></li>     
    </ul>
</td>
</<tr>
<tr><td colspan="6">INTEGRANTES:
<ul>
<li>Jack Franco Llaique Chullunquia - jllaiquec@unsa.edu.pe</li>
<li>Leonardo Juan Jose Baca Calsin - lbacac@unsa.edu.pe</li>
<li>Giovanni Patrick Mejia Rondan - gmejiar@unsa.edu.pe</li>
<li>Edson Fabricio Subia Huaicane - esubiah@unsa.edu.pe</li>
</ul>
</td>
</<tr>
</tdbody>
</table>

# Perl - Devian - Git - GitHub - Vim - Html - Css - Dockerfile 

[![Perl][Perl]][perl-site]
[![Debian][Debian]][debian-site]
[![Git][Git]][git-site]
[![GitHub][GitHub]][github-site]
[![Vim][Vim]][vim-site]
[![HTML][HTML]][html-site]
[![CSS][CSS]][css-site]
[![Dockerfile][Dockerfile]][dockerfile-site]

#

## OBJETIVOS TEMAS Y COMPETENCIAS

### OBJETIVOS

- Aprender a manejar el sistema de control de versiones Git y utilizar GitHub para trabajar de manera colaborativa.
- Crear un programa que permita realizar consultas dinámicas sobre un archivo de universidades licenciadas mediante un formulario web interactivo.
- Utilizar CGI para procesar solicitudes y generar respuestas dinámicas en función de los datos del archivo.
- Emplear expresiones regulares para extraer y manipular campos específicos del archivo de manera precisa y rápida.

### TEMAS
- Dockerfile
- Perl
- Css
- Html
- Git
- GitHub

<details>
<summary>COMPETENCIAS</summary>

- Comprender el funcionamiento de CGI y su integración con HTML para aplicaciones dinámicas.
- Implementar lógica del lado del servidor para procesar datos y responder a las solicitudes del usuario.
- Integrar distintas tecnologías (CGI, HTML, CSS, procesamiento de archivos) para lograr una solución coherente.

</details>

## EJERCICIO PROPUESTO
- Escribir un programa web que utilice CGI, HTML, CSS, que haga consultas sobre el archivo de universidades licenciadas.
- El archivo debe ser procesado con una expresión regular para extraer todos sus campos, al estilo del ejemplo unificado.
- La consulta debe ser una respuesta a un formulario html.  
- Se debe de trabajar con GIT - GITHUB

## LINKS
- Link de Github Grupal
   https://github.com/Q3son/pw1-24b.git
- Link de Laboratorio 06
   https://github.com/Q3son/pw1-24b/tree/main/lab06
  
# COMMITS
- Comenzamos extrayendo los datos de las universidades y organizándolos en un archivo .csv con información clave como ubicación, tipo de gestión y estado de licenciamiento. Luego, revisamos la consistencia de los datos antes de subirlos al repositorio grupal.
  ![image](https://github.com/user-attachments/assets/358c0a86-d7b8-47f7-82e2-9d31f6303c5f)
- Definimos un script en Perl para configurar los criterios de búsqueda de universidades, asegurándonos de manejar correctamente caracteres en UTF-8.
  ![image](https://github.com/user-attachments/assets/b5ab62c2-6af7-45b5-ae42-0abaabcf1e68)
- Preparamos una página web básica en HTML para el buscador de universidades, asegurando compatibilidad con dispositivos móviles.
- Incorporamos un formulario inicial que conecta con un script Perl para procesar búsquedas y vinculamos un archivo CSS externo para personalizar la apariencia.
  ![image](https://github.com/user-attachments/assets/cf2bdc79-6921-4161-8725-ab2d9958c9e6)
- Agregamos campos para el nombre de la universidad con tildes y un selector para el tipo de gestión (público o privado) en el formulario.
  ![image](https://github.com/user-attachments/assets/808b9dec-f61f-4aa4-9c2b-ef840ee40b77)
- Incluimos nuevos campos en el formulario, como el estado de licenciamiento con varias opciones y fechas de inicio y fin para acotar las búsquedas.
  ![image](https://github.com/user-attachments/assets/15afd345-8d92-4106-a5ed-06ae5390563a)
- Añadimos campos para ingresar el periodo de licenciamiento en años y un selector para departamentos como Lima, Arequipa y Cusco. También incorporamos un botón para enviar las búsquedas.
  ![image](https://github.com/user-attachments/assets/416d7f56-de65-478f-944a-3532424d0910)
- Organizamos el formulario para incluir filtros clave como el nombre de la universidad, tipo de gestión, estado de licenciamiento y rangos de fechas. Añadimos listas desplegables con departamentos, provincias y distritos del Perú.
  ![image](https://github.com/user-attachments/assets/2e859112-0f69-48f6-ba8a-ed99b0a598f8)
  ![image](https://github.com/user-attachments/assets/b33dd0db-f59d-4544-bc12-eec7eb40f2b8)
- Reestructuramos el formulario para incluir campos clave como nombre, tipo de gestión, estado de licenciamiento, periodo, y fechas.
  ![image](https://github.com/user-attachments/assets/b6b930e4-b2c0-43d4-b5b0-c1440d456b8a)
- Comenzamos a editar el Css y comenzams con una base sencilla
  ![image](https://github.com/user-attachments/assets/cdc6608c-243a-4703-abb1-d7117fbd6845)
- Mejoramos el diseño con fondo degradado e imagen fija, transparencias en el formulario, sombras sutiles y ajustes en texto para mayor legibilidad y contraste.
  ![image](https://github.com/user-attachments/assets/273f46ec-8715-4d7f-b546-d6cca7084e77)
  ![image](https://github.com/user-attachments/assets/a777f54a-7c22-474f-84de-0c2d044b2118)
- Optimizamos el diseño con un formulario centrado, fondo oscuro, bordes redondeados y efectos de transición. Ajustamos el ancho dinámico para adaptabilidad
  ![image](https://github.com/user-attachments/assets/889ac8a4-bc1a-4655-b040-05dee640f43b)
- Ampliamos el diseño del formulario con un ancho máximo mayor y mayor padding para comodidad visual. Aumentamos el tamaño de las fuentes en títulos, campos y etiquetas, y ajustamos los márgenes para una distribución más limpia.
  ![image](https://github.com/user-attachments/assets/f0661858-0498-4aa6-bddb-7b3559bf03e3)
- Modificaciones en el formulario con un fondo semi-transparente y bordes redondeados, ajustando el ancho máximo y las sombras para un diseño más limpio. Redimensionamos los títulos, inputs, y botones para mayor legibilidad y proporción. 
  ![image](https://github.com/user-attachments/assets/a772e664-ccc0-4a74-94be-21e9b187ca4c)
- Quitamos y modificamos varias lineas de codigo en el archivo Css, para que tenga una mejor vista y las modificaciones se acomoden mejor.
  ![image](https://github.com/user-attachments/assets/07608f17-a389-4f7c-8c99-27229660b940)
- Ultimas modificaciones del diseño con un fondo translúcido oscuro, bordes redondeados y sombras suaves para el formulario. Ajustamos los inputs, selects y botones con efectos de enfoque y hover, mejorando el contraste y la legibilidad.
  ![image](https://github.com/user-attachments/assets/471946ae-e4d1-4bd3-8f10-252e7aaab517)
  ![image](https://github.com/user-attachments/assets/0538b8f5-97f2-4ece-bc97-f91c502d9be6)
- Con estas últimas modificaciones, tenemos casi listo el archivo CSS. Si surgiera alguna modificación adicional, será para pequeños ajustes o mejoras específicas.
  ![image](https://github.com/user-attachments/assets/ac4c49b3-780d-40f3-b2c1-499d077248f9)
  ![image](https://github.com/user-attachments/assets/ab93bec5-57eb-43b6-ba01-c5361766696e)
  ![image](https://github.com/user-attachments/assets/4df4b107-2bf2-4ea4-81c4-865641e56275)
- El script procesa datos enviados vía CGI, configurando UTF-8 para caracteres especiales. Decodifica parámetros del formulario y genera una respuesta HTML con la información ingresada
  ![image](https://github.com/user-attachments/assets/46c0d7e1-01d1-42c6-808d-7bf8371a8aec)
- Sincronizamos las actualizaciones y aseguramos que el proyecto esté al día con los últimos ajustes.
  ![image](https://github.com/user-attachments/assets/f65eabf0-0104-4c35-9c5b-2392c0c02cb0)
  ![image](https://github.com/user-attachments/assets/cac4b743-aa3c-4ceb-b74a-aea75c460641)
- Este script en Perl utiliza Text::CSV para leer y procesar un archivo CSV con información de universidades. Permite recibir parámetros vía CGI desde un formulario y genera una respuesta HTML mostrando los datos filtrados
  ![image](https://github.com/user-attachments/assets/13a82599-62f0-4a44-9f92-0e5ae0a18549)
- Esta modificación incluye una función para convertir fechas de búsqueda al formato yyyymmdd, facilitando la comparación con los datos en la tabla, y prepara un array para almacenar las universidades procesadas.
  ![image](https://github.com/user-attachments/assets/ee72969b-b05d-4133-8b62-228556e7708d)
- Comenzamos con el Dockerfile definiendo la imagen base de Ubuntu 22.04, que servirá como punto de partida para configurar el entorno necesario.
  ![image](https://github.com/user-attachments/assets/c66b04c4-1649-4c87-9c48-de12f229bfe8)
- Como primera modificación del Dockerfile, establecemos la zona horaria a UTC. Se utiliza el comando RUN para instalar y configurar el paquete tzdata, asegurando que el entorno del contenedor esté sincronizado con la zona horaria correcta.
  ![image](https://github.com/user-attachments/assets/ef1a049c-5997-4a04-9f99-47588af8ad52)
- Continuamos con la instalación de Apache, Perl y otros paquetes esenciales para el proyecto. Se incluyen libapache2-mod-perl2 para la integración de Perl con Apache, junto con herramientas como curl, vim y libcgi-pm-perl para el manejo de scripts CGI. 
  ![image](https://github.com/user-attachments/assets/272037f6-5315-47fe-ae50-15e8eefa5c03)
- Habilitamos los módulos CGI y Perl en Apache utilizando a2enmod. Esto asegura que el servidor Apache pueda procesar scripts CGI y ejecutar aplicaciones en Perl.
  ![image](https://github.com/user-attachments/assets/0e7bc2e8-dd8e-4e2d-bcba-778bd99dfd6f)
- Copiamos los archivos del proyecto al contenedor, asignamos permisos a los scripts y configuramos el directorio CGI en Apache para ejecutar .pl
  ![image](https://github.com/user-attachments/assets/07b7c2fe-e2c9-4f50-bfb8-4c65fa144b07)
  ![image](https://github.com/user-attachments/assets/4866efdc-da51-46ce-849c-325e8b745ab4)
  ![image](https://github.com/user-attachments/assets/7df0bdfe-b4f0-40d9-83e3-2bd247446e18)
- Exponemos los puertos 80 y 22 para HTTP y SSH, respectivamente, y configuramos el comando de inicio para activar el servicio SSH y ejecutar Apache en primer plano.
  ![image](https://github.com/user-attachments/assets/3263af1a-03fa-4a65-a860-a7a2cda454ba)
- El script filtra datos de un archivo CSV de universidades según criterios ingresados, como nombre, gestión, estado, fechas y ubicación, y muestra los resultados en HTML.
  ![image](https://github.com/user-attachments/assets/079f037f-6007-419f-8c32-bd7374ed4704)
  ![image](https://github.com/user-attachments/assets/07494f76-1336-4808-886b-295c34ff5bf6)
- Realizamos ajustes en las referencias al archivo .csv, cambiando el uso de mayúsculas a minúsculas para asegurar su correcta identificación por el programa.
  ![image](https://github.com/user-attachments/assets/9053ede5-ce1f-49f0-8a67-691b51974688)
- Añadimos el archivo ReadmeExecutable.txt a la carpeta lab06, donde describimos los pasos para construir y ejecutar el proyecto en Docker
  ![image](https://github.com/user-attachments/assets/f925d5cc-979e-42e4-9fc4-18425cf19477)
- El script procesa datos de un archivo CSV filtra universidades según los criterios ingresados, y presenta los resultados. Si hay múltiples coincidencias, las muestra en una tabla HTML. Si hay una única coincidencia, redirige a su ubicación en Google Maps.
  ![image](https://github.com/user-attachments/assets/ad218f20-026e-4cdc-b075-c830e8f5a758)
  ![image](https://github.com/user-attachments/assets/06fcaf44-e969-4c08-a14b-8263e8559430)
- Cada entrada muestra detalles como nombre, tipo, estado, fechas, periodo y ubicación. Si no hay coincidencias, se informa al usuario con un mensaje claro. Finalmente, se cierra el archivo CSV utilizado
  ![image](https://github.com/user-attachments/assets/f80480ef-082c-4738-b89e-90081956fd95)
- Si hay una coincidencia, redirige a Google Maps con su ubicación. Para múltiples resultados, genera una tabla HTML detallada. Si no se encuentran coincidencias, muestra un mensaje informativo.
  ![image](https://github.com/user-attachments/assets/fc104c37-6c5a-4dfb-a125-d243b5bc02f0)
  ![image](https://github.com/user-attachments/assets/64078760-ea5a-4da0-abca-4c3a8703f44c)
  ![image](https://github.com/user-attachments/assets/7186ee35-b944-4871-8893-2e6d172f9c7c)
- Con esto, finalizamos la configuración del Dockerfile, dejando listo el entorno para ejecutar el proyecto con todas las dependencias y ajustes necesarios.
  ![image](https://github.com/user-attachments/assets/367aa56b-104b-4b46-ba45-e5079c82d656)
  ![image](https://github.com/user-attachments/assets/f99a7efd-e2b8-47fc-8fc9-8fd4b9bc85d5)
- Con todo esto listo, pongamoslo en marcha. Aplicamos los comandos del archivo ReadExecutable.txt
  ![image](https://github.com/user-attachments/assets/ff154d8e-0929-43d0-a92e-3e34c84ff4f3)
  ![image](https://github.com/user-attachments/assets/50de0614-8bbe-40ce-b63c-2d11237de9db)
- Aqui lo tenemos
  ![image](https://github.com/user-attachments/assets/0e0df185-1df7-4f8a-bf43-b571da5140c0)
- Colocamos los datos de nuestra universidad UNSA.
  ![image](https://github.com/user-attachments/assets/2ad06c44-1310-4b65-a7f2-b39a20622924)


## CUESTIONARIO
- ¿Por qué Git y GitHub son herramientas importantes para el curso?
Git y GitHub son herramientas fundamentales para cualquier curso que involucre desarrollo de software o proyectos colaborativos por varias razones
      - Control de Versiones: Git es un sistema de control de versiones que permite a los desarrolladores seguir el historial de cambios en su código. Esto es crucial para poder revertir a versiones anteriores si algo sale mal, y para entender cómo ha evolucionado el proyecto.
      - Colaboración: GitHub es una plataforma basada en la web que utiliza Git y facilita la colaboración entre múltiples desarrolladores. Permite compartir y fusionar cambios fácilmente, manejar conflictos y trabajar en diferentes ramas del proyecto simultáneamente.
      - Transparencia y Registro: Con Git y GitHub, todas las modificaciones son registradas con comentarios y datos del autor, proporcionando un historial completo y transparente de cada contribución.
      - Automatización y CI/CD: GitHub ofrece integraciones con herramientas de integración continua y despliegue continuo (CI/CD), facilitando la automatización de pruebas y despliegues, lo cual es esencial para mantener la calidad del software.
      - Comunidad y Soporte: GitHub también sirve como una red social para desarrolladores, permitiendo a los estudiantes aprender de otros proyectos, contribuir a proyectos open source y recibir feedback de la comunidad.

- ¿Qué conductas éticas deberían promocionarse cuando se usa un Sistema de Control de Versiones?
Cuando se utiliza un Sistema de Control de Versiones como Git, es importante promover ciertas conductas éticas para asegurar un ambiente colaborativo y profesional
    - Respeto y Colaboración: Valorar y respetar el trabajo de otros, contribuir de manera constructiva y estar abierto a recibir y dar feedback.
    - Claridad y Transparencia: Hacer commits con comentarios claros y descriptivos que expliquen los cambios realizados. La transparencia ayuda a otros miembros del equipo a entender las modificaciones y el razonamiento detrás de ellas.
    - Responsabilidad: Asumir la responsabilidad por los cambios realizados, incluyendo la corrección de errores que puedan surgir de tus propias contribuciones.
    - Honestidad: No atribuirse el trabajo de otros y siempre dar crédito a las contribuciones ajenas. Además, no esconder cambios importantes o realizar modificaciones sin consultarlo con el equipo cuando sea necesario.
    - Seguridad y Privacidad: Proteger la información sensible y seguir las políticas de seguridad de la organización. No compartir credenciales o datos privados a través del repositorio.
- ¿Qué son los entándares de codificación?
Los estándares de codificación son un conjunto de reglas y directrices que los desarrolladores siguen para escribir código de manera consistente y comprensible. Estos estándares pueden incluir
    - Convenciones de Nomenclatura: Reglas sobre cómo nombrar variables, funciones, clases y otros elementos del código para mantener la consistencia.
    - Formateo del Código: Directrices sobre la indentación, el uso de espacios y tabulaciones, la longitud máxima de las líneas y otros aspectos de la presentación del código.
    - Documentación: Requisitos para la documentación del código, como comentarios y descripciones de funciones, para que otros desarrolladores puedan entender fácilmente el propósito y funcionamiento del código.
    - Buenas Prácticas: Recomendaciones sobre prácticas de programación que mejoran la legibilidad, mantenibilidad y eficiencia del código, como el uso de patrones de diseño, la modularización y la prevención de errores comunes.
    - Seguridad: Normas para garantizar que el código sea seguro y esté protegido contra vulnerabilidades comunes.
#

## REFERENCIAS
- Dockerfile: Docker. (2024). Dockerfile reference. https://docs.docker.com/reference/dockerfile/

- HTML y CSS: Mozilla Developer Network. (2024). HTML y CSS Essentials. https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML_and_CSS

- CGI: W3Schools. (2024). Common Gateway Interface (CGI). https://www.w3schools.com/cgi/

- Git: Git Documentation. (2024). Git Reference Manual. https://git-scm.com/docs

- GitHub: GitHub Docs. (2024). GitHub Guides. https://docs.github.com/en

#

[Perl]: https://img.shields.io/badge/Perl-39457E?style=for-the-badge&logo=perl&logoColor=white
[perl-site]: https://www.perl.org/

[Debian]: https://img.shields.io/badge/Debian-D70A53?style=for-the-badge&logo=debian&logoColor=white
[debian-site]: https://www.debian.org/index.es.html

[Git]: https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white
[git-site]: https://git-scm.com/

[GitHub]: https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white
[github-site]: https://github.com/

[HTML]: https://img.shields.io/badge/HTML-E34F26?style=for-the-badge&logo=html5&logoColor=white
[html-site]: https://developer.mozilla.org/en-US/docs/Web/HTML

[CSS]: https://img.shields.io/badge/CSS-1572B6?style=for-the-badge&logo=css3&logoColor=white
[css-site]: https://developer.mozilla.org/en-US/docs/Web/CSS

[Vim]: https://img.shields.io/badge/VIM-%2311AB00.svg?style=for-the-badge&logo=vim&logoColor=white
[vim-site]: https://www.vim.org/

[Dockerfile]: https://img.shields.io/badge/Dockerfile-2496ED?style=for-the-badge&logo=docker&logoColor=white
[dockerfile-site]: https://docs.docker.com/engine/reference/builder/


[![Perl][Perl]][perl-site]
[![Debian][Debian]][debian-site]
[![Git][Git]][git-site]
[![GitHub][GitHub]][github-site]
[![Vim][Vim]][vim-site]
[![HTML][HTML]][html-site]
[![CSS][CSS]][css-site]
[![Dockerfile][Dockerfile]][dockerfile-site]


