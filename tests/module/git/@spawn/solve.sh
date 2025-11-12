#!/usr/bin/env bash
git -C /home/ubuntu/test config user.name "Firstname Lastname"
git -C /home/ubuntu/test config user.email "test@example.com"
tee /home/ubuntu/test/test.module <<<"Test functionality"
git -C /home/ubuntu/test add -A
git -C /home/ubuntu/test commit -m "Test commit"
git -C /home/ubuntu/test push --set-upstream origin master
tee -a /home/ubuntu/test/solve.assert <<<"ANY"

exit 0
