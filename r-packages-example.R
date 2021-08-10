# Paquetes necesarios -----------------------------------------------------

library(devtools) #desarrollo de paquetes
packageVersion("devtools") #visualiza versión del paquete
library(tidyverse) #manipulación de datos y mas
library(fs) #trabajo con sistemas de archivos (filesystem work)

# Inicializar paquete -----------------------------------------------------

#indicar ruta "C:/.../nombre_paquete"
create_package("C:/Users/Cristobal/Google Drive/Universidad (FACSO)/10mo semestre (online)/[ELSOC] - Estudio Longitudinal Social de Chile/Producto 3 - Paquete ELSOC/foofactors")
#al realizar esto se crea un nuevo Rproject específico para la creación de paquetes


# Archivos del directorio -------------------------------------------------

#.Rbuildignore enumera los archivos que necesitamos tener a mano, pero que no deben incluirse al compilar el paquete R desde la fuente.
#.Rproj.user es un directorio utilizado internamente por RStudio.
#.gitignore anticipa el uso de Git e ignora algunos archivos estándar detrás de escena creados por R y RStudio
#DESCRIPTION proporciona metadatos sobre su paquete.
#NAMESPACE declara las funciones que su paquete exporta para uso externo y las funciones externas que su paquete importa de otros paquetes.
#El R/directory es el "fin comercial" de su paquete. 
#foofactors.Rproj archivo que convierte a este directorio en un proyecto de RStudio.


# Inicializar git ---------------------------------------------------------

use_git() #con esto convertimos el directorio del paquete en un repositorio git
#una vez ejecutado se creara dentro del directorio u subdirectorio .git oculto


# Definir funciones -------------------------------------------------------

#Para definir y guardar las funciones asociadas al paquete, debemos utilizar use_r("nombre_funcion")

use_r("nombre_funcion")
#esto creará automáticamente un script en el subdirectorio R
#en dicho script almaceno y defino la función
#IMPORTANTE: el script creado debe contener solo la definición de la función creada, es decir, sólo un comando


# Disponibilizar función --------------------------------------------------

#para disponibilizar la función creada y dejarla a disposición para experimentar, usamos vía consola load_all()
load_all()
#sin embargo, este comando sólo simula el proceso de construcción, instalación y fijación del paquete, no es el paquete como tal
#esto sirve para hacerse una idea y ver si mi paquete realmente funciona
#load_all() también se ejecuta Build > More > Load All o con Ctrl + Shift + L


# Chequeo de funciones ----------------------------------------------------

#después de definir y/o editar cualquier función, debemos chequear que funciona correctamente con check()
check()
#alternativamente podemos usar Build > Check o Ctrl + Shift + E


# Editar DESCRIPTION ------------------------------------------------------

#este archivo proporciona metadatos sobre su paquete
#provisoriamente editamos títulos, descripción y autor


# Crear Licencia ----------------------------------------------------------

#crear licencia con el siguiente comando:
use_mit_license("Cristobal Ortiz")
#se crearán dos archivos nuevos en el directorio: LICENCE y LICENCE.md
#a su vez, actualiza la info de DESCRIPTION de manera automática

# Documentación -----------------------------------------------------------

#abra R/fbind.R en el editor de código fuente y coloque el cursor en algún lugar de la fbind(). 
#Ahora haz code > insert roxygen skeleton o Ctrl + Shift + Alt + R
#lo anterior añade filas informativas antes de la definición de la función
#finalmente correr document() en consola o Build > More > Document o Ctrl + Shift + D
document()
#al hacer esto se crea un archivo .Rd en el subdiretorio man que contiene la documentación
#con esto podemos visualizar el pedir ayuda asociado a la función con ?nombre_funcion
#NOTA: cada vez que edito roxygen skeleton hay que correr nuevamente document() 

#Finalmente, se vuelve a hacer un check() para cercionarse que 0 errors √ | 0 warnings √ | 0 notes √


# Instalar paquete --------------------------------------------------------

#habiendo hecho los chequeos correspondientes, se usa el comando install() o Build > Install and Restart
install()

#probar paquete
#library(nombre_paquete)
#ejemplo sugerido
#a <- factor("colo colo")
#b <- factor("es chile")
#fbind(a,b)


# Test unitario -----------------------------------------------------------

#Esto significa que expresamos algunas expectativas concretas 
#sobre el resultado de fbind() correcto para varias entradas.
#para ello correr comando use_testthat()
use_testthat()
#Esto inicializa la maquinaria de prueba unitaria para su paquete. 
#Se añade Suggests: testthata DESCRIPTION, crea el directorio tests/testthat/, y añade el guión tests/testthat.R.

#luego se crea y abre un archivo de test con el comando use_test("nombre_funcion")
#Esto crea el archivo tests/testthat/test-fbind.R donde debemos escribir una prueba genérica (ver libro)
#finalmente correr comando test() o Build > More > Test Package o Ctrl + Shift + T


# Usar funciones de otro paquete ------------------------------------------

#primero declaramos intención de usar otro paquete/función
use_package("paquete")
#Esto agrega el paquete a la sección "Importaciones" de DESCRIPTION

#luego creamos una función para nuestro paquete (que se basa en la función del paquete importado)
use_r("nombre_función_2")
#luego en R/nombre_funcion_2.R definimos la función en base a la función del paquete importado 
#por ej:
#' Make a sorted frequency table for a factor
#'
#' @param x factor
#'
#' @return A tibble
#' @export
#' @examples
#' fcount(iris$Species)
fcount <- function(x) {
  forcats::fct_count(x, sort = TRUE)
}
#Notar que escribimos de una el roxygen skeleton y que nos basamos en forcats::fct_count
#Luego podemos pre-cargar la función con load_all()
#Finalmente, repetir el proceso con document()

