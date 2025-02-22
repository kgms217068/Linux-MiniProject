#!/bin/bash

echo "🔹 사용자 관리 스크립트 🔹"
echo "1) 새 사용자 추가"
echo "2) 비밀번호 설정"
echo "3) 특정 그룹에 사용자 추가"
echo "4) 파일/디렉토리 권한 설정"
echo "5) 사용자 목록 확인"
echo "6) 사용자 삭제"

read -p "숫자입력: " choice

case $choice in
1)
  echo "사용자 이름을 입력하세요: "
  read username
  sudo useradd -m $username
  echo "$username 계정이 생성되었습니다."
  ;;
2)
  read -p "비밀번호를 설정할 사용자계정: " username
  sudo passwd $username
  sudo passwd -S $username
  echo "$username의 비밀번호가 변경되었습니다."
  ;;
3)
  read -p "특정 그룹 입력: " group
  read -p "추가할 사용자 입력: " username
  usermod -g $group $username
  echo "$username이 $group에 추가되었습니다."
  find /etc/passwd -name "$username"
  ;;
4)
  read -p "파일/디렉토리 경로: " filePath
  read -p "새로운 권한(예: 755)" permission
  chmod $permission $filePath
  echo "$filePath의 권한이 $permission으로 변경되었습니다."
  ;;
5)
   cat /etc/passwd | grep /home | cut -d: -f1
  ;;

6)
  read -p "삭제할 사용자 입력: " username
  userdel -r $username
  echo "$username 계정이 삭제되었습니다."
  cat /etc/passwd | grep /home | cut -d: -f1
  ;;

*)
  echo "error"
  esac
