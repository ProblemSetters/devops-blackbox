#!/usr/bin/env bash
cat <<SOLUTION >/home/ubuntu/test/playbook.yml
---
- hosts: localhost
  tasks:
    - name: Create IAM user
      community.aws.iam_user:
        name: "Test"
        state: present
    - name: Solution
      ansible.builtin.copy:
        content: "ANY\n"
        dest: /home/ubuntu/test/solve.assert

SOLUTION

exit 0
