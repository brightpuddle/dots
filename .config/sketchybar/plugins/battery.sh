#!/bin/bash

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

sketchybar --set ${NAME} icon.color=0xff989898

if [[ ${CHARGING} != "" ]]; then
	sketchybar --set ${NAME} icon=" "
	sketchybar --set ${NAME} label="${BATT_PERCENT}%"
	exit 0
fi

case ${BATT_PERCENT} in
100)
	ICON="  "
	COLOR="0xffa3be8c"
	;;
9[0-9])
	ICON="  "
	COLOR="0xffa3be8c"
	;;
[7-8][0-9])
	ICON="  "
	COLOR="0xffa3be8c"
	;;
[4-6][0-9])
	ICON="  "
	COLOR="0xffebcb8b"
	;;
[2-3][0-9])
	ICON="  "
	COLOR="0xffd08770"
	;;
1[0-9])
	ICON="  "
	COLOR="0xffbf616a"
	;;
*)
	ICON="  "
	COLOR="0xffbf616a"
	;;
esac

sketchybar \
	--set ${NAME} icon="${ICON}" \
	--set ${NAME} icon.color="${COLOR}" \
	--set ${NAME} label="${BATT_PERCENT}%"
