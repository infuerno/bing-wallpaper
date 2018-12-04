#!/usr/bin/env bash

# NOTE - see log messages using
# log show --predicate 'process == "logger"' --last 30m

PICTURE_DIR="$HOME/Dropbox/Pictures/Wallpaper/Bing"
ICON_DIR="$HOME/Projects/GitHub/bing-wallpaper/Icons"

logger -s "Checking for new Bing wallpaper ..."

data=$(curl -sL http://www.bing.com/?cc=gb)

urls=( $( echo $data | \
    grep -Eo "url: ?\".*?\"" | \
    sed -e "s/url: \"\([^\"]*\)\".*/http:\/\/bing.com\1/" | \
    sed -e "s/\\\//g") )

logger -s "Url of today's Bing wallpaper: $urls"

for p in ${urls[@]}; do
    filename=$(echo $p|sed -e "s/.*\/\(.*\)/\1/")
    if [ ! -f $PICTURE_DIR/$filename ]; then
        logger -s "Downloading to $PICTURE_DIR/$filename ..."
        curl -Lo "$PICTURE_DIR/$filename" $p
    else
        logger -s "Already downloaded to $PICTURE_DIR/$filename"
    fi
    logger -s "Setting desktop wallpaper to $PICTURE_DIR/$filename"
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$PICTURE_DIR/$filename\""
done

logger -s "Extracting notification info ..."

# extract notification message
message=$(echo $data | grep -Eo "mcImgData ={\"copyright\":\"[^\"]*\"" | \
    sed -e "s/mcImgData ={\"copyright\":\"\([^\"]*\)\".*/\1/")

# extract url
url=$(echo $data | grep -Eo -m 1 "href=\"/search.q=[^\"]*\"" | \
	head -1 | \
    sed -e "s/href=\"\([^\"]*\)\"/https:\/\/www.bing.com\1/" | \
    sed -e "s/&amp;/\&/g")
logger -s "$url2"

# unencode url
#logger -s "Encoding url: $url"
#url=$(python -c 'import sys, urllib; print urllib.unquote(sys.argv[1])' "$url")

logger -s "Creating notification: $message at $url"
/usr/local/bin/terminal-notifier -title "Bing Wallpaper" -message "$message" -open "$url" -appIcon "$ICON_DIR/bing-icon.png"
