#!/usr/bin/env bash
r10k puppetfile install --moduledir="/etc/puppetlabs/code/modules/" --verbose
puppet apply --verbose manifest.pp

exit 0
