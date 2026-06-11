#!/usr/bin/env bash
cat <<"SOLUTION" >/home/ubuntu/test/script.ps1
"ANY`n" | Out-File -FilePath "/home/ubuntu/test/solve.assert" -NoNewline

SOLUTION

pushd /home/ubuntu/test && {
  sudo solve
}

exit 0
