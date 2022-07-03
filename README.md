# Prueba técnica Fracttal - Backend
#### Autor: Genaro Coronel

Este proyecto fue creado con Ruby on Rails version 6

## Tecnologías utilizadas

<li> Ruby 2.6.6 </li>
<li> Rails 6.0.0 </li>
<li> Sqlite3 </li>

## Instalaciones necesarias

<li> Ruby 2.6.6 </li>
<li> rvm (Ruby version manager ) </li>
<li> nvm (Node version manager) </li>

## Versiones de nodejs y npm

<li> Nodejs 14.18.2 </li>
<li> npm 8.3.0 </li>

## Comandos para instalación en Linux


##### Instalaciones basicas
`yum install -y gcc openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel ruby-devel gcc-c++ jq git`

##### Importar key de rvm
`curl -sSL https://rvm.io/pkuczynski.asc | sudo gpg2 --import - `

##### Instalacion de rvm
`curl -sSL https://get.rvm.io | bash -s stable`

##### Agregar permisos a usuario para utilizar rvm
`sudo chown -R user:rvm /usr/local/rvm/*`

* reemplazar user por tu usuario 
* reemplazar /usr/local/rvm por el path en donde se instalo rvm

##### Instalar ruby 2.6.6 con rvm
`rvm install 2.6.6`

##### Actualizar sqlite3 a la version 3.8.11

`wget https://kojipkgs.fedoraproject.org//packages/sqlite/3.8.11/1.fc21/x86_64/sqlite-devel-3.8.11-1.fc21.x86_64.rpm`

`wget https://kojipkgs.fedoraproject.org//packages/sqlite/3.8.11/1.fc21/x86_64/sqlite-3.8.11-1.fc21.x86_64.rpm`

`sudo yum install sqlite-3.8.11-1.fc21.x86_64.rpm sqlite-devel-3.8.11-1.fc21.x86_64.rpm`

##### Instalar nvm

`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash`


##### Instalar nodejs y npm con nvm

`nvm install 14.18.2`

## Configuración el proyecto

Descargar el repositorio

`git clone https://github.com/Genaro-Coronel-Gtz/prueba-tecnica-backend.git`

`cd prueba-tecnica-backend`

Instalar las gemas necesarias para el proyecto

`bundle install`

Crear la BD

`rails db:create `

Ejecutar las migraciones para la BD

`rails db:migrate`

## Levantar el servidor

Para levantar el servidor se pueden utilizar cualquiera de los 2 siguientes comandos:

`rails server -p 5000`

`bundle exec rails s -p 5000 -b '0.0.0.0'`

