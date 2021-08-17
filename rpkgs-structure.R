#Cuando creamos o modificamos paquetes trabajamos sobre el código fuente (source code) o 
#Los paquetes tienen 5 estados:
#1. source (fuente) -> directorio de archivos con una estructura específica (y componentes específicos)
#2. bundled (empaquetado) -> directorio comprimido en un sólo archico .tar.gz
#3. bianry
#4. installed
#5. in memory

#install.packages() and devtools::install_github() move a package 
#from source, bundled, or binary states into the installed state

#library() function loads an installed package into memory, 
#making it available for immediate and direct use.