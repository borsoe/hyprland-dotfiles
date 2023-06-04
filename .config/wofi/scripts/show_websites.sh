#!/bin/bash

# Define an associative array of websites with their names and URLs
declare -A websites=(
  ["Wanikani"]="https://www.wanikani.com/dashboard"
  ["KaniWani"]="https://kaniwani.com/"
  ["WaniKani Stats"]="https://www.wkstats.com/"
  ["Codecks-Twins"]="https://twins.codecks.io/decks"
  ["YouTube"]="https://www.youtube.com/"
  ["Google Drive"]="https://drive.google.com/drive/u/0/my-drive"
  ["ChatGPT"]="https://chat.openai.com/"
  ["Github"]="https://github.com/borsoe?tab=repositories"
  ["NX-Brew"]="https://nxbrew.com/"
  ["Download Rooz"]="https://keily.gary-oldman.net/"
  ["Zoroto"]="https://zoro.to/"
  ["Hyprland Wiki"]="https://wiki.hyprland.org/"
)

# Define the directory to store website icons
icons_dir="$HOME/.website-icons"

# Ensure the icons directory exists
mkdir -p "$icons_dir"


# Function to fetch the favicon using favicongrabber API
fetch_favicon_from_api() {
  local url="$1"
  local icon_file="$2"

  # Extract the relevant part of the URL until the first "/"
  local api_url="${url#*//}"
  api_url="${api_url%%/*}"


  # Fetch the website icon using the google favicon icon grabber API
  wget "https://www.google.com/s2/favicons?domain=$api_url&sz=256" --output-document "$icon_file"
}

# Generate and cache website icons
for name in "${!websites[@]}"; do
  url="${websites[$name]}"
  icon_file="$icons_dir/$(echo "$url" | md5sum | awk '{print $1}').png"
  if [[ ! -f $icon_file ]]; then
    fetch_favicon_from_api "$url" "$icon_file"
  fi
done

# Generate the formatted list of websites for wofi
formatted_list=""
for name in "${!websites[@]}"; do
  url="${websites[$name]}"
  icon_file="$icons_dir/$(echo "$url" | md5sum | awk '{print $1}').png"
  formatted_list+="img:$icon_file:text:$name\n"
done

# Use wofi to display the website list with icons and store the selected website name
selected_entry=$(echo -e "$formatted_list" | wofi --show dmenu --allow-images --style ~/.config/wofi/style/style-dark.css -l top)

# If a website name is selected, open the corresponding URL in Firefox
if [[ -n $selected_entry ]]; then
  selected_name=$(echo "$selected_entry" | awk -F 'text:' '{print $2}')
  selected_url="${websites[$selected_name]}"
  firefox "$selected_url"
fi

