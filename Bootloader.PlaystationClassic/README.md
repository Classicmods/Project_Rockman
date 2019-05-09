# BleemSync Bootloader

**This is the OSC for the PlayStation bootloader. This is dangerous code to play around with especially if you do not know what you are doing and run the potential to brick your or other's systems!**

**This code is purely for educational purposes, we accept 0% responsibility for any damage to any console or misuse of this bootloader.**

## Flags

The Bootloader uses the following flags:
- __UPDATE_TELNET__ : Updates the RNDIS/FTP/Telnet Hack
- __UPDATE_SSH__ : Installs and Updates SSH
- __UPDATE_USBHOST__ : Updates the USBHost Service that changes to HOST mode
- __BACKUP_MAIN__ : Backs up main partition set
- __BACKUP_KERNEL__ : Backs up kernel partition only
- __BACKUP_RECOVERY__ : Backs up the recovery partition set
- __RESTORE_MAIN__ : Restores main partiton set. _WARNING: ALL DATA WILL BE LOST_
- __RESTORE_KERNEL__ : Restores kernel partition
- __RESTORE_RECOVERY__ : Restores the recovery partition set
- __UNINSTALL__ : Uninstalls all hacks completely.