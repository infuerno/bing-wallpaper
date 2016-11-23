#!/usr/bin/env bash
logger -s "Checking for new Bing Wallpaper..."
PICTURE_DIR="$HOME/Dropbox/Pictures/Wallpaper/Bing"
NOTIFY_ICON="$HOME/Dropbox/Pictures/Icons/bing-icon.png"

data=$(curl -sL http://www.bing.com/?cc=gb)

urls=( $( echo $data | \
    grep -Eo "url: ?\".*?\"" | \
    sed -e "s/url: \"\([^\"]*\)\".*/http:\/\/bing.com\1/" | \
    sed -e "s/\\\//g") )

logger -s "Url of current wallpaper(s): $urls"

for p in ${urls[@]}; do
    filename=$(echo $p|sed -e "s/.*\/\(.*\)/\1/")
    if [ ! -f $PICTURE_DIR/$filename ]; then
        logger -s "Downloading: $filename ..."
        curl -Lo "$PICTURE_DIR/$filename" $p
    else
        logger -s "Already downloaded, skipping downloading: $filename ..."
    fi
    logger -s "Setting desktop wallpaper to $PICTURE_DIR/$filename"
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$PICTURE_DIR/$filename\""
done

logger -s "Extracting notification info..."

# extract notification message
message=$(echo $data | grep -Eo -m 1 " alt=\"[^\"]*\"" | \
    head -1 | \
    sed -e "s/ alt=\"\([^\"]*\)\".*/\1/")

# extract url
url=$(echo $data | grep -Eo -m 1 "\"/search.q=[^\"]*\"" | \
    head -1 | \
    sed -e "s/\"\([^\"]*\)\"/http:\/\/www.bing.com\1/" | \
    sed -e "s/&amp;/\&/g")

# unencode url
url=$(python -c 'import sys, urllib; print urllib.unquote(sys.argv[1])' "$url")

# sometimes the url comes twice, so just get the first one
# url=$(echo $url | sed -n 's/\([^ ]*\).*/\1/p')

logger -s "Creating notification: $message at $url"
/usr/local/bin/terminal-notifier -title "Bing Wallpaper" -message "$message" -open "$url" -appIcon "$NOTIFY_ICON"


