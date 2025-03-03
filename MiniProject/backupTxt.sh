#!/bin/bash
#자동화스크립트
mkdir -p backup
read -p ".txt 파일을 찾을 폴더명을 입력하세요:" filename

if [ ! -d "$filename" ]; 
then
  echo "입력한 폴더가 존재하지 않습니다. 다시시도해주세요."

else 
find "$filename" -name "*.txt" -exec cp {} backup/ \;
ls backup

fi
