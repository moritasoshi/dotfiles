# minify pdf
function pdfmin() {
  local cnt=0
  for i in $@; do
    gs -sDEVICE=pdfwrite \
      -dCompatibilityLevel=1.4 \
      -dPDFSETTINGS=/screen \
      -dNOPAUSE -dQUIET -dBATCH \
      -sOutputFile=${i%.*}.min.pdf ${i} &
    (((cnt += 1) % 4 == 0)) && wait
  done
  wait && return 0
}


# ファイルのfirst~lastの行抽出
function mid() {
       local first=$1
       local last=$2
       local in=$3
       awk -v first=${first} -v last=${last} 'FNR>first&&last>FNR {print}' ${in}
}
