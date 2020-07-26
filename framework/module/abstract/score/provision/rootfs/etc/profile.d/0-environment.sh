if [ -z "$PS1" ]; then
  return
fi

shopt -os allexport && {
  . /etc/environment
  shopt -ou allexport
}


