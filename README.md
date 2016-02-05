Bing Wallpaper for Mac
======================

Information
-----------
Automator app which initially runs a script to downloads the latest picture of the day from Bing.com, saves it to a directory and fires a notification using terminal-notifier with a link to the homepage for that picture. Finally sets the desktop wallpaper to the new picture.

Setup
-----

```
$ cd ~/Projects
$ git clone https://github.com/infuerno/bing-wallpaper
$ cp bing-wallpaper/Tools/Bing\ Wallpaper.app/ /Applications
$ cp bing-wallpaper/Tools/com.ideasftw.bing-wallpaper.plist $HOME/Library/LaunchAgents
$ launchctl load $HOME/Library/LaunchAgents/com.ideasftw.bing-wallpaper.plist

```

* If desired, update the default **PICTURE_DIR** in **bing-wallpaper.sh** to the
wallpaper directory. 
* Open Mac's `System Preferences` -> `Desktop & Screensaver`, add the wallpaper
directory, and configure to taste.

Acknowledgements
----------------

This version forked from [thejandroman/bing-wallpaper](https://github.com/thejandroman/bing-wallpaper)
Originally forked from [ktmud/bing-wallpaper](https://github.com/ktmud/bing-wallpaper).


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/infuerno/bing-wallpaper/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
