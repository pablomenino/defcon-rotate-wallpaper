# defcon-rotate-wallpaper

defcon-rotate-wallpaper is 1080p wallpaper for Gnmoe 3 that change the color over time.

defcon-rotate-wallpaper support themes (group of image) that can be added to a new directory, and in the configuration file you can select the theme to use.

This script was tested on Fedora 23 and Ubuntu 14.04, but is supposed to work on all linux distributions.

![ScreenShot](https://raw.githubusercontent.com/pablomenino/defcon-rotate-wallpaper/master/docs/ani.gif)

## Table of contents

* [How to Use](#how-to-use)
* [Credit](#credit)

## <a name="how-to-use">How to Use

#### Requirements

* Gnome 3
* BASH
* The scripts need the gsettings-desktop-schemas package to change the wallpaper.

To install gsettings-desktop-schemas On Fedora 23:

```bash
sudo dnf install gsettings-desktop-schemas
```

#### Usage

Manually add the script to the user crontab.

List crontab jobs for the current user:

```bash
crontab -l
```

Edit crontab jobs for the current user:

```bash
crontab -e
```

Add this line to the crontab jobs list for the user. Change PATH-TO-SCRIPT to the directory where the defcon-rotate-wallpaper.sh is.

```
0 * * * * /PATH-TO-SCRIPT/defcon-rotate-wallpaper/defcon-rotate-wallpaper.sh --rotate
```

## <a name="credit">Credit

[**Defcon Game**] The images are inspired on this game.
