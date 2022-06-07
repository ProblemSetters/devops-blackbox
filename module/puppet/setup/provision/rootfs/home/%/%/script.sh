#!/usr/bin/env bash
puppet parser --verbose validate manifest.pp
puppet apply --verbose manifest.pp
exit 0
