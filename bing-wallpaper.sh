#!/usr/bin/env bash
logger -s "Checking for new Bing Wallpaper..."
PICTURE_DIR="$HOME/Dropbox/Pictures/Wallpaper/Bing/"
NOTIFY_ICON="$HOME/Dropbox/Pictures/Icons/bing-icon.png"

data=$(curl -s http://www.bing.com)

urls=( $( echo $data | \
    grep -Eo "g_img={url:'.*?'" | \
    sed -e "s/g_img={url:'\([^']*\)'.*/http:\/\/bing.com\1/" | \
    sed -e "s/\\\//g") )

for p in ${urls[@]}; do
    filename=$(echo $p|sed -e "s/.*\/\(.*\)/\1/")
    if [ ! -f $PICTURE_DIR/$filename ]; then
        logger -s "Downloading: $filename ..."
        curl -Lo "$PICTURE_DIR/$filename" $p
    else
        logger -s "Skipping: $filename ..."
    fi
done

sleep 1s

message=$(echo $data | grep -Eo " alt=\"[^\"]*\"" | \
     sed -e "s/ alt=\"\([^\"]*\)\".*/\1/")

url=$(echo $data | grep -Eo "\"/search.q=[^\"]*\"" | \
    sed -e "s/\"\([^\"]*\)\"/http:\/\/www.bing.com\1/" | \
    sed -e "s/&amp;/\&/g")

url=$(python -c 'import sys, urllib; print urllib.unquote(sys.argv[1])' "$url")

logger -s "Creating notification: $message at $url"
/usr/local/bin/terminal-notifier -title "Bing Wallpaper" -message "$message" -open "$url" -appIcon "$NOTIFY_ICON"
