#!/bin/sh

#최신순 정렬-t / 크기순 정렬-S /
#소유권 일치 파일 찾기find, 특정 파일 형식만 출력하기find

echo "검색할 디렉토리 이름을 입력해주세요: "
read directory

echo "조건을 입력해주세요: "
echo -e "정렬\n최신순:1,\n크기순:2,\n허가권일치파일찾기:3,\n특정파일 형식만 출력하기:4"
read order


case $order in
 1)
    ls -alt "$directory"
 ;;
 2) 
    ls -alS "$directory"
 ;;
 3)
    echo "허가권을 입력해주세요(ex:755 or rwxr-xr-x):"
    read permission
    find "$directory" -type f -perm "$permission"
 ;;
 4)
    echo "찾을 파일 형식을 입력해주세요(ex:*.txt)"
    read fileFormat
    find "$directory" -name "*"$fileFormat
 ;;
 *)
 echo "error"
 esac
