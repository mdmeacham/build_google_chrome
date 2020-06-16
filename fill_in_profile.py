#!/usr/bin/python3
from string import Template
import sys

with open('profile_template.xml', 'r') as file:
    template = Template(file.read()).substitute({'VERSION':sys.argv[1]})

print(template)
