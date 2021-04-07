#!/usr/bin/env python3

import winrm
import json
import sys

alias = sys.argv[1]
print("Alias: " + alias)

with open('data/options.json') as f:
    config = json.load(f)
computers = config.get('computers')
for computer in computers:
    if alias != computer.get('alias'):
        continue
    address = computer.get('address')
    username = computer.get('username')
    password = computer.get('password')
    print('Executing command on remote machine ' + address + ' as ' + username + ". ")
    s = winrm.Session(address, auth=(username, password), transport=computer.get('transport'))
    r = s.run_cmd(computer.get('command'))
    print(r.std_out)
    print(r.std_err)
    break
