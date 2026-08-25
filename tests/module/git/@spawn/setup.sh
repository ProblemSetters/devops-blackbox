#!/usr/bin/env bash
. <(cat /blackbox/blackbox 2>/dev/null || wget -qO- --no-cache "https://raw.githubusercontent.com/dhairya-hackerrank/devops-blackbox/2404/blackbox" || printf "echo 'error: *** blackbox is not available'; exit 1") git setup "test"

exit 0
