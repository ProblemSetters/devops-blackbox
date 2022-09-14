#!/usr/bin/env bash
case $- in
  *i*) [ -z "$PS1" ] && return ;;
  *) return ;;
esac

export PS1="\[\e[1;42m\][\u@\H:\w]\$\[\e[0m\] "
