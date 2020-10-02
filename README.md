<h3 align="center">defcon-rotate-wallpaper</h3>
<p align="center">defcon-rotate-wallpaper is 1080p wallpaper for Gnmoe 3 that change the color over time.</p>

<p align="center">
<img src="https://img.shields.io/github/release/pablomenino/defcon-rotate-wallpaper.svg">
<img src="https://img.shields.io/github/license/pablomenino/defcon-rotate-wallpaper.svg">
</p>

defcon-rotate-wallpaper is 1080p wallpaper for Gnmoe 3 that change the color over time.

defcon-rotate-wallpaper support themes (group of image) that can be added to a new directory, and in the configuration file you can select the theme to use.

This script was tested on Fedora 23 and Ubuntu 14.04, but is supposed to work on all linux distributions.

![ScreenShot](https://raw.githubusercontent.com/pablomenino/defcon-rotate-wallpaper/master/docs/ani.gif)

## Table of contents

* [How to Use](#how-to-use)
* [Known Bugs](#known-bugs)
* [Credit](#credit)

## <a name="how-to-use">How to Use

#### Requirements

* Gnome 3
* BASH
* The scripts need the gsettings-desktop-schemas package to change the wallpaper.
* gsettings

To install gsettings-desktop-schemas On Fedora 23:

```bash
sudo dnf install gsettings-desktop-schemas
```

To install gsettings-desktop-schemas On Ubuntu 14.04:

```bash
sudo apt-get install gsettings-desktop-schemas
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
*/2 * * * * /PATH-TO-SCRIPT/defcon-rotate-wallpaper.sh --rotate  >/dev/null 2>&1
```

## <a name="known-bugs">Known Bugs

#### Fedora 23:

On kernel version kernel-4.3.3-300.fc23.x86_64, there is a bug whit SElinux/crontab, when you add a new job on crontab wit command "crontab -e" it doesn't work (you get a context error). This was fixed in the new kernel.

You can follow the link for the workarround.

[https://github.com/pablomenino/defcon-rotate-wallpaper/wiki/Fedora-23](https://github.com/pablomenino/defcon-rotate-wallpaper/wiki/Fedora-23)

## <a name="credit">Credit

* **Defcon Game** The images are inspired on this game.
* **CampoSanto Theme** Images copyright [CampoSanto](http://blog.camposanto.com/post/138965082204/firewatch-launch-wallpaper-when-we-redid-the) - Walppaper from [SuperToaster94](https://imgur.com/gallery/D6ia1)
