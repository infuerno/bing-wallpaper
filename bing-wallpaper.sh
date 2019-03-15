#!/usr/bin/env bash

# NOTE - display log messages using
# log show --predicate 'process == "logger"' --last 30m

PICTURE_DIR="$HOME/Dropbox/Pictures/Wallpaper/Bing"
ICON_DIR="$HOME/Projects/GitHub/bing-wallpaper/Icons"
BASE_URL="https://www.bing.com"

logger -s "Checking for new Bing wallpaper ..."
data=$(curl -s "$BASE_URL/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-GB")

image_url=$( echo $data | grep -Eo '"url":.*?[^\\]"' | awk -F'"' '{print $4}' )
logger -s "Url of today's Bing wallpaper: $BASE_URL$image_url"

filename=$(echo $image_url | sed -e "s/[^.]*\.\([^.]*\).*/\1.jpg/")
logger -s "Using filename: $filename"

if [ ! -f $PICTURE_DIR/$filename ]; then
    logger -s "Downloading to $PICTURE_DIR/$filename ..."
    curl -Lo "$PICTURE_DIR/$filename" $BASE_URL$image_url

    # Remove previous picture from Today folder
    rm -f "$PICTURE_DIR"/Today/*
    # Copy newly downloaded file to Today folder
    cp "$PICTURE_DIR/$filename" "$PICTURE_DIR/Today/$filename"

    logger -s "Setting desktop wallpaper to $PICTURE_DIR/$filename"
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$PICTURE_DIR/$filename\""

    logger -s "Extracting notification info ..."
    copyright=$( echo $data | grep -Eo '"copyright":.*?[^\\]"' | awk -F'"' '{print $4}' )
    logger -s "$copyright"
    copyrightlink=$( echo $data | grep -Eo '"copyrightlink":.*?[^\\]"' | awk -F'"' '{print $4}' )
    logger -s "$copyrightlink"

    logger -s "Creating notification: $copyright at $copyrightlink"
    /usr/local/bin/terminal-notifier -title "Bing Wallpaper" -message "$copyright" -open "$copyrightlink" -appIcon "$ICON_DIR/bing-icon.png"
else
    logger -s "Already downloaded to $PICTURE_DIR/$filename"
    # TODO also check desktop is using this and set if not
fi
