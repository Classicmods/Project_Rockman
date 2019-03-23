# Creating additional application launchers for ui_menu
## Folder structure
bleemsync/etc/bleemsync/SUP/launchers/*[application_name]*

If `ui_app_launchers` is enabled the startup script will automatically load any valid application launchers found in this directory.
### Application configuration file
bleemsync/etc/bleemsync/SUP/launchers/*[application_name]*/launcher.cfg

This file must contain the following properties

| Property | Required | Description |
| - | - | - |
| launcher_filename | Y | Will be assigned as the ui_menu BASENAME. Your launcher picture must use this name for it to load correctly.  |
| launcher_title | Y | Title which will be displayed in ui_menu |
| launcher_publisher | N | Publisher which will be displayed in ui_menu |
| launcher_year | N | Year which will be displayed in ui_menu |

**Example launcher.cfg for bootmenu_launch**
```bash
launcher_filename="bootmenu"
launcher_title="Boot Menu"
launcher_publisher="ModMyClassic"
launcher_year="2019"
```
### Application execution
bleemsync/etc/bleemsync/SUP/launchers/*[application_name]*/launch.sh

This is a shell script which will automatically be executed once your application has been launched by ui_menu. It should contain the commands required to launch your application.

**Example launch.sh for bootmenu_launch**
```bash
#!/bin/sh
echo "launch_BootMenu" > "/tmp/launchfilecommand"
touch "/tmp/weston_need_restart.flag"
touch "/data/power/prepare_suspend"
```

### Application picture
bleemsync/etc/bleemsync/SUP/launchers/*[application_name]*/*[launcher_filename]*.png

This should be named the same as what you have used for `launcher_filename` in the configuration file.

**Example for bootmenu_launch**

bootmenu.png

