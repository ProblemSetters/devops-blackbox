#!/usr/bin/env bash
cat <<SOLUTION >/home/ubuntu/test/manifest.pp
file { '/home/ubuntu/test/solve.assert':
  ensure => file,
  content => "ANY\n"
}
SOLUTION

exit 0
