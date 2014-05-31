#! /bin/bash
# This script builds a "Larger" flask app conforming to
# http://flask.pocoo.org/docs/patterns/packages/
# For blueprints, see http://flask.pocoo.org/docs/blueprints/
# and http://www.realpython.com/blog/python/python-web-applications-with-flask-part-i (flask-tracking)

yourapplication=${1-"myapp"}

mkdir $yourapplication
cd $yourapplication
cat <<EOF > requirements.txt
Flask>=0.10.1
EOF

cat <<EOF > runserver.py
from $yourapplication import app
app.run(debug=True)
EOF

cat <<EOF > README.md
# $yourapplication

A "Larger" flask app conforming to
http://flask.pocoo.org/docs/patterns/packages/

Run with

    $ python runserver.py
     * Running on http://127.0.0.1:5000/

Now head over to http://127.0.0.1:5000/,
and you should see your hello world greeting.
EOF

mkdir $yourapplication
cd $yourapplication
cat <<EOF > __init__.py
from flask import Flask
app = Flask(__name__)

import $yourapplication.views
EOF

cat <<EOF > views.py
from $yourapplication import app
from flask import render_template

@app.route('/')
def index():
    return render_template('index.html')
EOF
mkdir static templates
cat <<EOF > static/style.css
body {
  font-family: sans-serif;
  font-size: 11pt;
}
EOF
cd templates
cat <<EOF > layout.html
<!DOCTYPE html>
<html lang="en">
  <head>
    {% block head %}
    <title>$yourapplication {% block title %}{% endblock %}</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="{{ url_for('static', filename='style.css') }}"/>
    {% endblock %}
  </head>
  <body>
  {% block body %}
  <h1>$yourapplication</h1>
  {% block content %}
  {% endblock %}
  {% endblock %}
  </body>
</html>
EOF
cat <<EOF > index.html
{% extends "layout.html" %}
{% block title %} - Home{% endblock %}
{% block content %}
Hello World
{% endblock %}
EOF
touch login.html
