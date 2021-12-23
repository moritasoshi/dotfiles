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


# ファイルのstart~endの行抽出
function mid() {
       local start=$1
       local end=$2
       local in=$3
       awk -v st=${start} -v en=${end} 'FNR>st&&en>FNR {print}' ${in}
}