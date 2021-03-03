#!/bin/bash
set -e

ARGC=("$#")

if [ $ARGC -ne 1 ]; then
  echo "ERROR"
  echo "Usage: bin/crear_proyecto.sh nombre_proyecto"
  exit
fi

if ! command -v prename &> /dev/null; then
  echo "ERROR: no existe el ejecutable prename"
  echo "Instalar con sudo apt install rename"
  exit
fi

NOMBRE_PROYECTO=("$1")

DESTINO="../$NOMBRE_PROYECTO"

if test -e "$DESTINO"; then
  echo "ERROR: ya existe el archivo $NOMBRE_PROYECTO"
  exit
fi

cp -r . $DESTINO
cd $DESTINO
git clean -fdX
git remote remove origin

mv README_for_cloned.md README.md

find app db config lib package.json .env README.md -type f -print0 | xargs -0 sed -i "s/pg_template/$NOMBRE_PROYECTO/g"
find app db config lib package.json .env README.md -type f -print0 | xargs -0 sed -i "s/PG_TEMPLATE/$NOMBRE_PROYECTO/g"
find app db config lib package.json .env README.md -type f -print0 | xargs -0 sed -i "s/template_pg/$NOMBRE_PROYECTO/g"
sed -i "s/CC_TEST_REPORTER_ID:.*/CC_TEST_REPORTER_ID: 'TODO: copiar código'/g" .circleci/config.yml


prename "s/pg_template/$NOMBRE_PROYECTO/" *
prename "s/pg_template/$NOMBRE_PROYECTO/" */*
prename "s/pg_template/$NOMBRE_PROYECTO/" */*/*

git add .
git commit -m "Rename de archivos"

echo "ÉXITO"
