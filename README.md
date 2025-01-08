# Prolog ARC Coursework

## Description
This is your repository for solving the Prolog ARC Coursework. 

Follow the instructions in the coursework spec. 

See `Usage` below for instructions on how to use this repository.

## Installation
### Sicstus
You will need to install Sicstus if you are running on your own machine:
https://www.doc.ic.ac.uk/csg-old/software/sicstus.

The default installation path on linux is '/usr/local/sicstus4.8.0/bin/sicstus'. You will need to change `SICTUS_PATH` in `utils.py` to the installed path.
 
If you want to use the lab machines, sicstus will already be installed and is in '/usr/bin/sictus', so there is no need to modify `utils.py`.

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

By default, blank solutions will be loaded.

You can also render the tasks using `apps/testing_interface.html` (open in browser).

Fill in `helpers.pl`, `solution_1.pl`, `solution_2.pl`, as instructed in the coursework spec.

To test your code locally, you can run `solution_tests.py`.
Your code will either time out or produce output images in the `plots` directory which render your solution.

To test your code online, push your changes to gitlab and test via labTS.

To submit your code, push your changes to gitlab, test and submit your code on labTS as usual.

## Advice
If your code times out, consider running your Sicstus programs manually to get more detailed feedback. 

Many technically correct solutions exist, which are computationally infeasible.

Try to work out if your code is doing unnecessary computations including doing the same calculations multiple times.

For subtle issues, consider using the Sicstus debugger.

## Additional Challenges
If you finish the challenges quickly and are interested in practicing prolog more, I have selected some additional tasks `grids`, `cross` and `stripes`. 
Feel free to have a go at these, but do so in new files (e.g. `solution_3.pl` etc.).
You can test these by extending the code in `solution_tests.py`.

If this is still not enough, you will find 400 tasks in `data/training`.