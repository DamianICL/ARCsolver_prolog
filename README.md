# Prolog ARC

## Description
This repository is designed to implement a logic program for solving simple example of the ARC AGI challenge. 

## Installation
### Sicstus
You will need to install Sicstus to run the program:
https://sicstus.sics.se/download4.html

### Python
Tests run on python virtual environment '/vol/lab/ml/venv_tests'.

You can install numpy, pandas and matplotlib via the requirements file. 

## Usage
To start with, activate the virtual environment and run `solution_tests.py`, which will generate images in the `plots` directory demonstrating the tasks.

```
source /vol/lab/ml/venv_tests/bin/activate
python3 solution_tests.py
```

You can also render the tasks using `apps/testing_interface.html` (open in browser).


To test your code locally, you can run `solution_tests.py`.
Your code will either time out or produce output images in the `plots` directory which render your solution.
