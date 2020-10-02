#!/bin/bash
mount / -o remount,size=1G /run/archiso/cowspace
pacman -S ansible python-pip
pip install pexpect
ansible-playbook main.yml