#!/bin/sh

# Required packages
REQUIRED_PKG=jq

# Check if required packages are installed?
package_installed=$(dpkg-query --list | grep -w "${REQUIRED_PKG}")

if [ -z "$package_installed" ]; then
    echo "Installing required packages ${REQUIRED_PKG}"
    sudo apt install $REQUIRED_PKG
fi

top_story_id=$(curl -s 'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty' | jq '.[0]')

top_story_url='https://hacker-news.firebaseio.com/v0/item/'${top_story_id}'.json?print=pretty'

top_story_response=$(curl -s $top_story_url)

## TODO : Continue with parse JSON response

top_story_title=$(echo "$top_story_response" | jq '.title')
top_story_url=$(echo "$top_story_response" | jq '.url')
top_story_posting_time=@$(echo "$top_story_response" | jq '.time')
top_story_posting_time_converted=$(date -u --date="$top_story_posting_time")

## Blinking
headline_style='\033[5m'
## Blue color
url_style='\033[0;34m'
## Bold White
title_style='\033[1;37m'

## Reset style
reset_style='\033[00m'

echo "${headline_style}Top story from Hacker news${reset_style}"
echo "Title: ${title_style}${top_story_title}${reset_style}"
echo "Click here: ${url_style}${top_story_url}${reset_style}"
echo "Posted at: ${top_story_posting_time_converted}"
