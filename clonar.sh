# sudo apt install rename

cp -r pg_template fom_industries
cd fom_industries
git clean -fdX
git remote remove origin
git remote add origin git@github.com:programandoarg/fom_industries.git
git push origin master

find . -type f -print0 | xargs -0 sed -i 's/pg_template/fom_industries/g'
find . -type f -print0 | xargs -0 sed -i 's/PG_TEMPLATE/FOM_INDUSTRIES/g'
find . -type f -print0 | xargs -0 sed -i 's/template_pg/fom_industries/g'

prename 's/pg_template/fom_industries/' *
prename 's/pg_template/fom_industries/' */*
prename 's/pg_template/fom_industries/' */*/*
