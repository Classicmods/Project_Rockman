-------------------
BleemSync CHANGELOG
-------------------

---------------------------------------------------------------------------------
MAKE SURE IF YOU DO A PULL REQUEST THAT YOU ADD THE FEATURE TO THE THE LIST BELOW
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
FEATURES TO GO INTO NEXT RELEASE
---------------------------------------------------------------------------------
- fixed broken RA font on copy over from console
- Migrate now migrates over cores and bios files correctly
- Added Credits and License information
- Added Uppercase support for alternative format games
- Fixed network RA buildbot issues.
- Fixed JAPAN console RA stock game list in RA GUI
- Fixed JAPAN stock EMMC games to prevent crashing when loading BS1.0 on JP console
- Optimised on console SQLITE3 code
- Fixed the chance of RA overwritting good fixed configs with crap ones.
- Fixed Old RA folder not moving to remove/ after migration 
- If no retroarch core options config exists then create. (Stops overwriting existing global core configs)
- Changed config logic so if no cfgs used for BS or RA then create them on load with defaults
- ADDED UPDATE_CONFIG, UPDATE_RA_CONFIG and UPDATE_BOOT to supported flags (use to force update cfg with defaults)
- Added Xpad driver support. Loads more controller support added, including Xbox 1, Xbox 360 and steam controller support. Mostly complete list available here:https://gist.githubusercontent.com/swingflip/70e5ec3e4b81e3e87d15823eaf241a09/raw/71e80ed9dd183335ed6e6c3adf7672e67d3c6839/gistfile1.txt
- Added SDL mapping support for the boot menu
- Added physical console button support for the boot menu 
(`reset` toggles options. `open` selects that option)
- Changed memory configuration to prevent crashes from occurring when memory limit is nearing. We now over commit memory so a lot of issues should now be prevented.
- overcommit the DRAM
- Created extra fast swap ram totalling to 512mb more memory split across 4 cores into 128mb banks to increase compatibility, stability and slight performance (in some small cases) 
- Added new bleemsync build of RetroArch 1.7.6
- UPX compressed 1.7.6
- Removed Standard Monochrome XMB theme assets
- Compressed all RA bundled assets 
- Added brand new Ozone theme as default (won't override existing set ups)
- Added compressed Ozone theme assets
- Prepped some code for OverClocking and network support within RA
- Optimised GDB and SQLite3
- Improved initial RA directory structure
- Optimised RA as a whole down from 18.2mb to 8.23mb (approx 50% reduction whilst include many more features)


---------------------------------------------------------------------------------
PREVIOUS RELEASE NOTES
---------------------------------------------------------------------------------

**BleemSync v1.0 Release Notes**  
**General Updates**

-   Added brand new UI to allow easy syncing and modding for your PlayStation Classic!
-   USB payload completely redone from scratch, much better design meaning more stability, faster boot times and more flexibility.
-   Added support to the stock console UI for the additional PS1 formats "m3u" "pbp" "img" "mdf" "toc" "cbn"
-   Completely new and improved bootloader. Contains more sense checking and script vetting to ensure no broken boots. (No more lolhack)
-   Auto deployment/install and update facility added.
-   Added permanent safe USB lockout disable, telnet and ftp support. (These services will install on initial install so you don’t need a USB to load these services)
-   Added NTFS and exFAT drive support. (Once initial install in complete)
-   Because of the USB lockout disable, you can now run psc from TVs and PC USB ports.
-   Improved LED support, green = idle/OK, orange = BS function running, flashing red = attention needed, see on screen. (You can now see exactly when something is running)
-   Added function libraries so you can add your own scripts in to the boot sequence if you wish for extra tinkering
-   Added boot profiler (Every function in the boot sequence will get timed and recorded so you can identify slow down issues within boot)
-   Integration of RetroArch by default (will be optional in later builds)
-   Added full verbose logging, any issues should now be logged easily within the logs directory of the USB to help easily identify common issues
-   Initial install sets up basis for backup/restore and OTG support (coming in 1.1)
-   Game folders are much less complicated and require less mounting per game.
-   Included patch pack for stock 20 games to run at full speed if launched via RetroArch PCSX from either stock UI or playlist.
-   Added auto migration tools to run on first boot after install.

**UI Features**

-   TBA

**Boot Updates**

-   Added the ability to fully customise your boot routine. You can select what functions/routines and extra debugging routines are run during boot time.
-   Added customisable boot options, including quick load, Heath check disable and custom splash screen support. (Static only supported for 1.0)
-   Added kickass BleemSync splash screen on load (Can be disabled or customised)
-   Added new build of BootMenu as default, now with BleemSync theme images and the ability to change the boot menu background theme too. (Just like the splashscreen)
-   Added boot menu music toggle
-   Bundled custom original (90s ps1 demo style) boot menu music
-   Added the facility so you can boot directly to the bootmenu, RetroArch or the stock UI. (Configurable from USB or UI)
-   Removed the long boot times, especially for large collections!

**Stock UI Updates**

-   Added ability to load in original 20 games on EMMC into the stock UI including your customs.
-   Added auto alphabetical’ising’ so you can sort automatically by alphabetical order. (You can also set your own order from the UI)
-   Added ability to easily load in custom UI themes, you can load as many themes on to the usb and select from the config.
-   Added ability to randomise themes on boot * Included completely original custom theme for bleemsync. (Configurable)
-   Themes now no longer need all theme files to work. Just requires the files you wish to replace. (Includes sounds)
-   Added the ability to launch all pcsx games from the stock UI with RetroArch PCSX (recommended!)
-   Added support for savestates and save files when launching games via RA PCSX
-   Added physical console button support to emulate stock PCSX emulator

**RetroArch Updates**

-   Improved the RetroArch deployment method for the PSC
-   Automatically loads in on console PS1 bios to RetroArch on first boot so no requirement to source ps1 bios
-   Improved playlist support to make it easier to use
-   Included all core info files by default
-   Fixed mappings for PS3 and PS4 controllers
-   Include completely custom and exclusive PSC RA theme. (A homage to the PS4 20th anniversary PS1 theme)
-   Also included updated monochrome theme (just switch from custom theme to monochrome if you wish)
-   Added overlay support with scanlines available by default
-   Added stock ps1 games in playlist so you can load stock games directly from RA playlist
-   Cut out dead weight and reduced file size of RetroArch
-   Improved screenshot saving for retroarch when saving screenshots for save files
-   Redone initial config and optimised the settings for psc
-   Set proper notification background and fonts
-   Misc bug fixes and improvements

**Misc Updates**

-   Added devtools like GDB, readelf, ldd and nano etc. Also made accommodations so you can easily mount your own binaries/libraries to the console. (SAFELY)
-   Plus a ton more small things and other features I forgot to mention :)
