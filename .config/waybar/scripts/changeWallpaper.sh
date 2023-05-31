#!/bin/bash


wallPapers=("2945179021" "1616446193" "1101644547" "2884323042" "1351702222" "2522520175" "1780370333" "2779025264" "2782984961" "2513274779")
dir=$(dirname "$0")
file="${dir}/etc/wallpaperIndex"
fileAddress=$(readlink -f ${file})
if [[ -e ${file} ]]; then
  index=$(cat ${file})
else
  index=0
fi
listSize=${#wallPapers[@]}

killall linux-wallpaperengine

nextWallpaper(){
  if [[ ${index} -lt $((listSize-1)) && ${index} -ge 0 ]]; then
    ((index++))
    else
      index=0
  fi
}

prevWallpaper(){
  if [[ $index -gt 0 && $index -lt ${listSize} ]]; then
    ((index--))
    else
      index=$((listSize-1)) 
  fi
}

while getopts 'id' OPTION; do
  case "$OPTION" in
    i) nextWallpaper 
    ;;
    d) prevWallpaper
    ;;
  esac
  
done

echo ${index} > ${fileAddress} 

linux-wallpaperengine --screen-root DP-2 --silent --fps 60 ${wallPapers[index]} > /dev/null 2>&1 &
