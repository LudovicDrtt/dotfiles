#!/bin/python
import os
import tempfile
import subprocess
import re

def open_editor(filename):
    return subprocess.run([
        'urxvt',
        '-geometry', '60x5',
        '-name', 'popup-bottom-center',
        '-pt', 'Root', # Don't know what it is, but it ask for it
        '-e', "vim",
        f"{filename}",
    ])

def copy(string, target=None):
    extra_args = []
    if target != None:
        extra_args += ['-target', target]

    return subprocess.run(
        ['xclip', '-selection', 'c'] + extra_args,
        universal_newlines=True,
        input=string
    )

f = tempfile.NamedTemporaryFile(mode='w+', delete=False, suffix='.tex')

f.write('$$')
f.close()

open_editor(f.name)

print("read and copy")

latex = ""
with open(f.name, 'r') as g:
    latex = g.read().strip()

os.remove(f.name)

empty_math = re.compile(r'\$\s*\$')
if latex and (not empty_math.match(latex)):
    copy(latex)
