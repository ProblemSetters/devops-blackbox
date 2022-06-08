#!/usr/bin/env bash
r10k puppetfile install --verbose
puppet parser --verbose validate manifest.pp
puppet apply --verbose manifest.pp

exit 0
