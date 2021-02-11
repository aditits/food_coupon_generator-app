#!/bin/sh

set -e

echo "Hello here"
python manage.py collectstatic --noinput
python manage.py wait_for_db
python manage.py migrate
uwsgi --socket :9000 --workers 4 --master --enable-threads --module food_app.wsgi
echo "Ended script"
