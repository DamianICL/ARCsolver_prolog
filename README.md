# Prolog ARC

## Description
This repository is designed to implement a logic program for solving simple example of the ARC AGI challenge. 

## Installation
### Sicstus
You will need to install Sicstus to run the program:
https://sicstus.sics.se/download4.html

### Python
We are providing you with a python virtual environment '/vol/lab/ml/venv_tests'.

You could also create your own virtual environment and install numpy, pandas and matplotlib. 

The coursework was tested with python3.8. You are advised to use the same, though later versions will probably work.

## Usage
To start with, activate the virtual environment and run `solution_tests.py`, which will generate images in the `plots` directory demonstrating the tasks.

```
source /vol/lab/ml/venv_tests/bin/activate
python3 solution_tests.py
```

You can also render the tasks using `apps/testing_interface.html` (open in browser).


To test your code locally, you can run `solution_tests.py`.
Your code will either time out or produce output images in the `plots` directory which render your solution.
