case $- in
  *i*) [ -z "$PS1" ] && return ;;
  *) return ;;
esac

export PS1=$(printf "%s[%s]\033[0m " "$(if [[ "$(whoami)" == "root" ]]; then cat <<<"\033[1;41m"; else cat <<<"\033[1;42m"; fi)" "\u@\h:\w")
