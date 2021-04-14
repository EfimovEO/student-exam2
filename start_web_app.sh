
#!/bin/bash


#Install
python3 -m venv venv
. venv/bin/activate
pip install -e ./student-exam2

#RUN
export FLASK_APP=js_example
flask run --host=0.0.0.0
