#!/bin/bash

matrix_size=3

##Utility functions

matrix_max=$(($matrix_size - 1))

function clamp() {
    n=$(($1 < 0 ? 0 : $1))
    n=$(($n > $matrix_max ? $matrix_max : $n))
    echo $n
}

function cycle() {
    echo $((($1 + $matrix_size) % $matrix_size))
}

##Get active workspace, and translate to rows and cols

active_ws=$(hyprctl monitors | grep "focused: yes" -B 10 | grep "active workspace" | awk -F': ' '{print $2}' | cut -d' ' -f1)
row=$((($active_ws - 1) / $matrix_size))
col=$((($active_ws - 1) % $matrix_size))

echo "$row : $col"


## Default values
func_name="clamp"
argument="up"

## Parse command-line options
while :; do
    case $1 in
        -c|--clamp)
            func_name="clamp"
            shift
            ;;
        -y|--cycle)
            func_name="cycle"
            shift
            ;;
        --)
            shift
            break
            ;;
        -*)
            echo "Invalid option: $1"
            exit 1
            ;;
        *)
            break
            ;;
    esac
done

## Process remaining arguments
if [[ $# -gt 0 ]]; then
    argument=$1
fi


##Apply change to animation
case $argument in
  "left" | "right" | "move_left" | "move_right") hyprctl keyword animation workspaces, 1, 8, workspaceChange, slide 
  ;;
  "up" | "down" | "move_up" | "move_down") hyprctl keyword animation workspaces, 1, 8, workspaceChange, slidevert
  ;;
  *) echo default
  ;;
esac

##Apply transformation
## change "cycle" to "clamp" to change the behavior

func_name=clamp

case $argument in
"up" | "move_up") row=$($func_name $(($row - 1))) ;;
"down" | "move_down") row=$($func_name $(($row + 1))) ;;
"left" | "move_left") col=$($func_name $(($col - 1))) ;;
"right" | "move_right") col=$($func_name $(($col + 1))) ;;
esac

## translate col+row back to workspace number and apply

echo "$row : $col"
ws=$(($row * matrix_size + $col + 1))
echo $ws

case "$1" in
	"left" | "right" | "up" | "down") hyprctl dispatch workspace $ws ;;
	"move_left" | "move_right" | "move_up" | "move_down") hyprctl dispatch movetoworkspace $ws ;;
esac

