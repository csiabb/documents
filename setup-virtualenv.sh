#!/bin/bash
set -x

param=""

# check if the virtualenv was already activated
if [ -z $VIRTUAL_ENV ]; then
  pip install --upgrade virtualenv
  virtualenv .venv
  . .venv/bin/activate
fi

pip install $param --upgrade pip setuptools
pip install $param -r ./requirements.txt
