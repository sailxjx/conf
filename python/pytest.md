# Execute as module and print to stdout

python3 -m pytest -s

# Use current dir as root path

PYTHONPATH=./ pytest ...

# Print in test

PYTHONPATH=./ pytest -s ...

# Test specific function

https://stackoverflow.com/questions/34833327/how-to-test-single-file-under-pytest

pytest file::method
