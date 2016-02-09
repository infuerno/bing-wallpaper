Bing Wallpaper for Mac
======================

Overview
--------

Automator app which initially runs a script to download the latest picture of the day from Bing.com, saves it to a directory and fires a notification using [terminal-notifier](https://github.com/julienXX/terminal-notifier) with a link to the homepage for that picture. Finally sets the desktop wallpaper to the newly downloaded picture.

Setup
-----

```
$ cd ~/Projects
$ git clone https://github.com/infuerno/bing-wallpaper
$ bing-wallpaper/setup.sh
```

Default Locations
-----------------

* Open the Bing Wallpaper.app using Automator and update the **bing-wallpaper.sh** location if required. Default is $HOME/Projects/bing-wallpaper/bing-wallpaper.sh
* Update the default **PICTURE_DIR** and **NOTIFY_ICON** in **bing-wallpaper.sh** if required. Default is $HOME/Dropbox/Pictures/Bing
* Update the **Bing Wallpaper.app** location in **Tools/com.ideasftw.bing-wallpaper.plist** if required. Default is $HOME/Applications/Bing Wallpaper.app (this is a symbolic link created by the setup.sh script)
* [Not necessary] Open Mac's `System Preferences` -> `Desktop & Screensaver` and configure to use the **PICTURE_DIR** location

Acknowledgements
----------------

This version forked from [thejandroman/bing-wallpaper](https://github.com/thejandroman/bing-wallpaper).



[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/infuerno/bing-wallpaper/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
