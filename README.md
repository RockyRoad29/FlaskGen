FlaskGen
========

Generating a [http://flask.pocoo.org](Flask) application layout with
the name of your choice.

Several models will be available on separate git branches.

For example:

    git check-out minimal -- flask-gen.sh
    ./flask-gen mysimpleapplication
    mv mysimpleapplication ~/MyProjects/

will generate all needed files for a working Flask application.

Check `mysimpleapplication/README.md` to see how to start it.
Then you can move the generated directory wherever you like and
extend it to your needs.

If you don't provide an argument (e.g. `mysimpleapplication`), your
new app will be named "myapp".

For convenience, the generated contents for "myapp" is tracked in the
git system; Specifying the script name on checkout command prevents
its extraction.


Licence
-------
Copyright (c) 2014 Michelle Baert

Distributed under the GNU GPL v2. For full terms see the file `LICENSE`.

