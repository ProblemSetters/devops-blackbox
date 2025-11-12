#!/usr/bin/env bash
cat <<SOLUTION >/home/ubuntu/test/playbook.yml
---
- hosts: localhost
  tasks:
    - name: Solution
      ansible.builtin.copy:
        content: "ANY\n"
        dest: /home/ubuntu/test/solve.assert

SOLUTION

exit 0
