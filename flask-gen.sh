#! /bin/bash

# Copyright (c) 2014 Michelle Baert
# Distributed under the GNU GPL v3. For full terms see the file `LICENSE`.

# This script builds a minimal flask app conforming to
# http://flask.pocoo.org/docs/quickstart

yourapplication=${1-"myapp"}

mkdir $yourapplication
cd $yourapplication
cat <<EOF > requirements.txt
Flask>=0.10.1
EOF
cat <<EOF > $yourapplication.py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World!'

if __name__ == '__main__':
    app.run()
EOF
cat <<EOF > README.md
# $yourapplication

A minimal flask app conforming to
http://flask.pocoo.org/docs/quickstart

Run with

    $ python $yourapplication.py
     * Running on http://127.0.0.1:5000/

Now head over to http://127.0.0.1:5000/,
and you should see your hello world greeting.


EOF
