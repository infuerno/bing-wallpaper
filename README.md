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
$ ln -s $HOME/Projects/bing-wallpaper/Tools/Bing\ Wallpaper.app $HOME/Applications
$ ln -s $HOME/Projects/bing-wallpaper/Tools/com.ideasftw.bing-wallpaper.plist $HOME/Library/LaunchAgents
$ launchctl load $HOME/Library/LaunchAgents/com.ideasftw.bing-wallpaper.plist

```

Default Locations
-----------------

* Open the Bing Wallpaper.app using Automator and update the **bing-wallpaper.sh** location as required. Default is $HOME/Projects/bing-wallpaper/bing-wallpaper.sh
* Update the default **PICTURE_DIR** and **NOTIFY_ICON** in **bing-wallpaper.sh** as required. Default is $HOME/Dropbox/Pictures/Bing
* Open Mac's `System Preferences` -> `Desktop & Screensaver` and configure to use the **PICTURE_DIR** location as set
* Update the **Bing Wallpaper.app** location in **Tools/com.ideasftw.bing-wallpaper.plist** as required. Default is $HOME/Applications/Bing Wallpaper.app

Acknowledgements
----------------

This version forked from [thejandroman/bing-wallpaper](https://github.com/thejandroman/bing-wallpaper).

Originally forked from [ktmud/bing-wallpaper](https://github.com/ktmud/bing-wallpaper).


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/infuerno/bing-wallpaper/trend.png)](https://bitdeli.com/free "Bitdeli Badge")


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/infuerno/bing-wallpaper/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

