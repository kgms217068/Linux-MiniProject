#!/bin/bash

module="dd"
CPU_LIMIT=80

while true; do
  cpu_usage=$(ps -eo pid,%cpu,command --sort=-%cpu | grep "$module" | awk -v limit="$CPU_LIMIT" '{if($2 > limit) print $1,$2}')

  if [ ! -z "$cpu_usage" ];then
     PID=$(echo $cpu_usage | awk '{print $1}')
     CPU=$(echo $cpu_usage | awk '{print $2}')

      echo "[경고] $module (PID:$PID)이 CPU $CPU를 사용중 - 종료합니다."
      kill -9 $PID
  fi

done
