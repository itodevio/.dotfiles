#!/usr/bin/env bash
check() {
  command -v "$1" 1>/dev/null
}

DEFAULT_COLOR=$(grep 'color7' "$HOME/.cache/wal/colors-waybar.css" | sed -E 's/.*(#.*);/\1/')

loc="$HOME/.cache/colorpicker"
[ -d "$loc" ] || mkdir -p "$loc"
[ -f "$loc/colors" ] || touch "$loc/colors"

limit=10

[[ $# -eq 1 && $1 = "-l" ]] && {
  cat "$loc/colors"
  exit
}

[[ $# -eq 1 && $1 = "-j" ]] && {
  color="$(head -n 1 "$loc/colors")"

  if [ -z "$color" ]; then
    color="$DEFAULT_COLOR"
  fi

  mapfile -t allcolors < <(tail -n +2 "$loc/colors")
  # allcolors=($(tail -n +2 "$loc/colors"))
  tooltip="<b>   COLORS</b>\n\n"

  tooltip+="-> <b>$color</b>  <span color='$color'></span>  \n"
  for i in "${allcolors[@]}"; do
    tooltip+="   <b>$i</b>  <span color='$i'></span>  \n"
  done

  cat <<EOF
{ "text":"<span color='$color'></span>", "tooltip":"$tooltip"}  
EOF

  exit
}

check hyprpicker || {
  notify "hyprpicker is not installed"
  exit
}
killall -q hyprpicker
color=$(hyprpicker)

check wl-copy && {
  echo "$color" | sed -z 's/\n//g' | wl-copy
}

prevColors=$(head -n $((limit - 1)) "$loc/colors")
echo "$color" >"$loc/colors"
echo "$prevColors" >>"$loc/colors"
sed -i '/^$/d' "$loc/colors"
source ~/.cache/wal/colors.sh && notify-send "Color Picker" "This color has been selected: $color" -i $wallpaper
pkill -RTMIN+1 waybar
