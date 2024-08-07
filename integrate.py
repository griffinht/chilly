#!/usr/bin/env python3

import json
import os
import subprocess
import sys
import tempfile

config = json.load(sys.stdin)

tmp = tempfile.mkdtemp()
os.system(f"git clone . {tmp}")
os.chdir(config['dir'])
result = subprocess.run(config['cmd'], shell=True)

if result.returncode != 0:
    print("steps to reproduce")
    print(f"cd {tmp}")
    print(f"cd {config['dir']}")
    print(f"{config['cmd']}")
else:
    print("hooray")

sys.exit(result.returncode)
