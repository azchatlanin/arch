#!/bin/bash
# mount / -o remount,size=1G /run/archiso/cowspace
# pacman -S ansible python-pip
# pip install pexpect
# ansible-playbook main.yml

## BASH_MATIC
BASH_MATIC=".bashmatic"
[[ -s ${BASH_MATIC}/init.sh ]] || {
  rm -rf "${BASH_MATIC}" 2>/dev/null
  git clone https://github.com/kigster/bashmatic "${BASH_MATIC}" 2>&1 1>/dev/null
}
source "${BASH_MATIC}/init.sh"

divider.header() {
  h1.purple "Install Arch Linux project"
  IFS="|" read -r -a g_plus_plus_info <<< "$(g++ --version 2>&1 | tr '\n' '|')"
  h1 "${bldylw}G++" "${g_plus_plus_info[1]}" "${g_plus_plus_info[2]}" "${g_plus_plus_info[3]}" "${g_plus_plus_info[4]}"
  h1 "${bldylw}GIT:    ${bldblu}$(git --version)"
  h1 "${bldylw}CMAKE:  ${bldblu}$(cmake --version | tr '\n' ' ')"
}

divider.cowspace() {
  hl.subtle "Resize cowspace"
  run "mount / -o remount,size=1G /run/archiso/cowspace"
}

divider.get_app() {
  hl.subtle "Get ansible python-pip"
  run.set-all show-output-on
  run "pacman -S ansible python-pip"
}

divider.pexpect() {
  hl.subtle "Install pexpect"
  run.set-all show-output-on
  run "pip install pexpect"
}

divider.run() {
  hl.subtle "Run install Arch"
  run.set-all show-output-on
  run "ansible-playbook main.yml"
}

main() {
  divider.header
  divider.cowspace
  divider.get_app
  divider.pexpect
  divider.run
}
main