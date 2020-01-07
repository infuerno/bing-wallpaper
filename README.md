Bing Wallpaper for Mac
======================

Overview
--------

Bash script which downloads the latest picture of the day from Bing.com, saves it to a directory and sets the desktop wallpaper to the newly downloaded picture. Finally fires a notification using [terminal-notifier](https://github.com/julienXX/terminal-notifier) with a link to the homepage for that picture. 

Setup
-----

Clone the repo, update default locations, run setup.sh

```
$ cd ~/Projects
$ git clone https://github.com/infuerno/bing-wallpaper
$ bing-wallpaper/setup.sh
```

Default Locations
-----------------

* Update the default **PICTURE_DIR** and **NOTIFY_ICON** in **bing-wallpaper.sh** if required. Default is $HOME/Dropbox/Pictures/Bing
* Update the **bing-wallpaper.sh** location in **Tools/com.ideasftw.bing-wallpaper.plist** if required. Default is /Users/[username]/Projects/github/[username]/bing-wallpaper/bing-wallpaper.sh
* [Not necessary] Open Mac's `System Preferences` -> `Desktop & Screensaver` and configure to use the **PICTURE_DIR** location

Acknowledgements
----------------

This version forked from [thejandroman/bing-wallpaper](https://github.com/thejandroman/bing-wallpaper).

