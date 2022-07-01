#!/usr/bin/env bash
case $- in
  *i*) [ -z "$PS1" ] && return ;;
  *) return ;;
esac

complete -C "/usr/local/aws-cli/v2/current/bin/aws_completer" aws
