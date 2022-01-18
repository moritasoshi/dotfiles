# jEnv
if which jenv > /dev/null; then
  _evalcache jenv init -
fi
export JAVA_HOME="$(jenv prefix)"
