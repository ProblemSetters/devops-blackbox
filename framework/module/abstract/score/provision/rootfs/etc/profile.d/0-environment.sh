case $- in
  *i*) [ -z "$PS1" ] && return ;;
  *) return ;;
esac

shopt -os allexport && {
  . /etc/environment
  shopt -ou allexport
}


