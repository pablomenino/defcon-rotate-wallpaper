# defcon-rotate-wallpaper

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
*/2 * * * * /PATH-TO-SCRIPT/defcon-rotate-wallpaper.sh --rotate
```

## <a name="known-bugs">Known Bugs

#### Fedora 23:

On kernel version kernel-4.3.3-300.fc23.x86_64, there is a bug whit SElinux/crontab, when you add a new job on crontab wit command "crontab -e" it doesn't work (you get a context error).

You can check if you have this type of errors:

# sudo systemctl status cron

Jan 28 13:27:01 LAB01 crond[1127]: (username) Unauthorized SELinux context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c....username)
Jan 28 13:27:01 LAB01 crond[1127]: (usernameo) FAILED (loading cron table)

Or in journal:

**Unauthorized SELinux context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 file_context=unconfined_u:object_r:user_cron_spool_t:s0**

This is an error whit cron and SElinux configured in Enforcing mode (This doesn't happens whit SElinux in permissive mode).

There is a workaround to fix this issue:

create a file:

$ vi mycron.cil

Add this to the file:

(allow unconfined_t user_cron_spool_t( file ( entrypoint)))

And run:

$ sudo semodule -i mycron.cil

Then reload cron:

$ sudo systemctl restart cron

This workaround is persistent to reboots.

To remove this workaround, you can execute:

$ sudo semodule -r mycron

## <a name="credit">Credit

[**Defcon Game**] The images are inspired on this game.
