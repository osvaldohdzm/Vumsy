

[TOC]

# App information

###### template_name
templates\\Plantilla SRE de reporte de análisis dinámico.docx

###### analysis_id
AD-21-074

###### analysis_revision_01
1.0

###### analysis_version_format_01
3er Análisis dinámico

###### analysis_version_format_02
tercer

###### app_url
https://consultadocumentosqa.sre.gob.mx

###### date_format_01
17/09/2021

###### date_format_02
09|2021

###### name_app
consultadocumentosqa.sre.gob.mx

###### reporter_01
Osvaldo Hernández Morales

###### request_date_format_01
20 de agosto de 2021

###### request_folio
SRE/TIN/E-3428/2021

###### responsible_01
Homero Piedras Rodríguez

###### responsible_charge_01
El Director de Área en la Dirección General de Tecnologías de Información e Innovación

###### scope_description_01
Sistema consultadocumentosqa.sre.gob.mx

###### scope_ip_01
172.18.217.32

###### scope_operative_system_01
Linux

###### scope_url_01
https://consultadocumentosqa.sre.gob.mx

###### executive_resume
Con el propósito de identificar las vulnerabilidades potenciales que pudieran comprometer la seguridad de la Información, se realizó este análisis dinámico del aplicativo. Las vulnerabilidades identificadas podrían permitir a un usuario malintencionado la carga de datos a través de origines no confiables. Esta vulnerabilidad se clasifica con un riesgo <<level_max>>, por lo que se considera que se deben realizar acciones para mitigar las vulnerabilidades expuestas ya que estas podrían afectar directamente a la confidencialidad de los sistemas involucrados

# Vulnerabilities
## Política permisiva con dominios que no son de confianza
###### cwe
CWE-942

###### risk_score
2.6

###### CVSS
AV:A/AC:H/PR:N/UI:R/S:U/C:L/I:N/A:N

###### ocurrences
1

###### clasification
-

###### ip
172.18.217.32

###### ports
443

###### risk
La carga de datos a través de origines no confiables puede ser posible, debido a una configuración incorrecta de Cross Origin Resource Sharing (CORS) en el servidor web.

###### description
CORS (Cross-Origin Resource Sharing) define un mecanismo para habilitar las solicitudes de origen cruzado del lado del cliente. Esta aplicación está utilizando CORS de una manera insegura. La aplicación web no puede validar correctamente el encabezado Origin (consulte la sección Detalles para obtener más información) y devuelve el encabezado Access-Control-Allow-Credentials: true.

En esta configuración, cualquier sitio web puede emitir solicitudes realizadas con credenciales de usuario y leer las respuestas a estas solicitudes.
Confiar en orígenes arbitrarios deshabilita efectivamente la política de mismo origen, lo que permite la interacción bidireccional de sitios web de terceros.

###### remediation
Permitir solo dominios seleccionados y de confianza en el encabezado Access-Control-Allow-Origin.

###### references
https://fetch.spec.whatwg.org/#security

###### vulnerability_path
https://consultadocumentosapiqa.sre.gob.mx/api/auth/binnacle

##### evidence

###### evidence_image_path
Diapositiva1.PNG

###### evidence_note
Nota de la primera evidencia.

##### evidence

###### evidence_image_path
Diapositiva1.PNG

###### evidence_note
Nota de la segunda evidencia.

## Cross Site Scripting

###### cwe
CWE-942

###### risk_score
2.6

###### CVSS
AV:A/AC:H/PR:N/UI:R/S:U/C:L/I:N/A:N

###### ocurrences
1

###### clasification
-

###### ip
172.18.217.32

###### ports
443

###### risk
La carga de datos a través de origines no confiables puede ser posible, debido a una configuración incorrecta de Cross Origin Resource Sharing (CORS) en el servidor web.

###### description
CORS (Cross-Origin Resource Sharing) define un mecanismo para habilitar las solicitudes de origen cruzado del lado del cliente. Esta aplicación está utilizando CORS de una manera insegura. La aplicación web no puede validar correctamente el encabezado Origin (consulte la sección Detalles para obtener más información) y devuelve el encabezado Access-Control-Allow-Credentials: true.

En esta configuración, cualquier sitio web puede emitir solicitudes realizadas con credenciales de usuario y leer las respuestas a estas solicitudes.
Confiar en orígenes arbitrarios deshabilita efectivamente la política de mismo origen, lo que permite la interacción bidireccional de sitios web de terceros.

###### remediation
Permitir solo dominios seleccionados y de confianza en el encabezado Access-Control-Allow-Origin.

###### references
https://fetch.spec.whatwg.org/#security
https://portswigger.net/research/exploiting-cors-misconfigurations-for-bitcoins-and-bounties

###### vulnerability_path
https://consultadocumentosapiqa.sre.gob.mx/api/auth/binnacle
https://consultadocumentosapiqa.sre.gob.mx/api/auth/catTypeDocument
https://consultadocumentosapiqa.sre.gob.mx/api/auth/catTypeDocumentLight
https://consultadocumentosapiqa.sre.gob.mx/api/auth/getBinnacle

##### evidence

###### evidence_image_path
Diapositiva1.PNG

###### evidence_note
La configuración incorrecta de CORS en el servidor web permite solicitudes de lectura entre dominios desde dominios de terceros arbitrarios, utilizando API no autenticadas en este dominio. Sin embargo, las implementaciones del navegador web no permiten que terceros arbitrarios lean la respuesta de las API autenticadas. Esto reduce un poco el riesgo sin embargo un atacante podría utilizar esta configuración incorrecta para acceder a datos que están disponibles de forma no autenticada, pero que utilizan alguna otra forma de seguridad, como la lista blanca de direcciones IP.