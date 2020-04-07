#!/bin/sh

set -xe

echo "Python interpreter"
echo `which python`
echo "OpenTURNS version"
python -c "import openturns; print(openturns.__version__); exit()"

# Run tests
cd ..

# Unit tests
cd tests
python demo_axialbeam.py
python demo_ishigami.py
python -m unittest discover .
cd ..

# Notebooks in all subdirectories
python tests/find-ipynb-files.py
