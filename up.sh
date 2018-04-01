#!/bin/bash

python manage.py db init
python manage.py db migrate
python manage.py db upgrade
echo "initted db"


echo "About to start"
python worker.py &
echo "Worker started"
python app.py &
echo "App started"
while sleep 60; do
  # infinite loop - yuck
  e = 3
done
