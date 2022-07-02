#!/usr/bin/env bash

# minify pdf
cnt=0
for i in "$@"; do
  gs -sDEVICE=pdfwrite \
    -dCompatibilityLevel=1.4 \
    -dPDFSETTINGS=/screen \
    -dNOPAUSE -dQUIET -dBATCH \
    -sOutputFile="${i%.*}".min.pdf "$i" &
  (((cnt += 1) % 4 == 0)) && wait
done
wait && exit 0
