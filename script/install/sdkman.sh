if [ -d ~/.sdkman ]; then
  echo "SDKMAN found."
else
  curl -s "https://get.sdkman.io" | bash
fi
