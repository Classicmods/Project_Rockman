# Backup and Restore - FAQ

## What does backup do?

Backup will create upgrade packages, containing your partitions. As those upgrade packages will need signatures to get installed, the signatures are created as well and attached to the debug packages.
To ensure, one does not accidentally try to restore a backup created from another console, the signature key is again encrypted with a unique key for each console.
The backups are created under
```
/media/bleemsync/backup
```
There are three kinds of backups:
- __LBOOT.EPB:__ Backup of the main partition (ROOTFS1), user data partition, kernel partition and trusted zone
- __LRECOVERY.EPB:__ Backup of the recovery partition (ROOTFS2), recovery kernel and recovery trusted zone
- __LBOOT_KERNEL.EPB:__ Backup of only the main kernel and the trusted zone

## How do I backup?


During boot Bleemsync Bootloader will check, if Backups are already present. If not, all backups are created.
You can also force creation of a new backup with the following flags:
- /media/bleemsync/flags/BACKUP_MAIN
- /media/bleemsync/flags/BACKUP_RECOVERY
- /media/bleemsync/flags/BACKUP_KERNEL

After backup:
___STORE YOUR BACKUPS SAVELY! YOUR USB DRIVE IS NOT A SAFE PLACE! SAVE IT TO YOUR PC, DROPBOX, NEXTCLOUD - WHATEVER!!!___

## What does restore do?

Restore will restore one of your backups. It uses the built in updater by SONY to do so.

## How do I restore?

Restore is triggered through the restore flags:
- /media/bleemsync/flags/RESTORE_MAIN
- /media/bleemsync/flags/RESTORE_RECOVERY
- /media/bleemsync/flags/RESTORE_KERNEL

Please note:
Restore will apply the complete backup as it is. This means your PSC will be set to the same state as when the backup was created.
All your settings, customizations and savegames that are on userdata WILL BE LOST.

## HELP!! My PSC does not boot after restore!!!

Overall this should not happen, as there is a verification before a backup gets flashed.
However, there still may be some reasons why this may happen:
- Backup got corrupted
- Power loss during restore
- Brown Out of USB drive

If such a case happens but you kept your backup save at another location there is no need to panic!

The PSC uses FASTBOOT as a last resort if any backup flashing went wrong.
Fastboot needs the raw partition image in order to restore. Therefore you need to do the following steps:
- Extract your EPBs (LBOOT, LRECOVERY) with a ZIP tool of your choice. It will extract the following files:
  - boot.img      (for LBOOT and LRECOVERY)
  - tz.img        (for LBOOT and LRECOVERY)
  - rootfs.ext4   (for LBOOT and LRECOVERY)
  - usrdata.ext4  (for LBOOT)
- Open your PSC and connect the two big points above the "LM-11" text with a paperclip
- Connect the PSC to the USB of your PC
- Use fastboot to flash the partitions

In Linux/Mac one can use the following shell script if fastboot is in your path:
```
#!/bin/sh
mkdir BOOT RECOVERY
unzip LBOOT.EPB -d BOOT
unzip LRECOVERY.EPB -d RECOVERY
fastboot flash BOOTIMG1 BOOT/boot.img
fastboot flash TEE1 BOOT/tz.img
fastboot flash ROOTFS1 BOOT/rootfs.ext4
fastboot flash USRDATA BOOT/userdata.ext4
fastboot flash BOOTIMG2 RECOVERY/boot.img
fastboot flash TEE2 RECOVERY/tz.img
fastboot flash ROOTFS2 RECOVERY/rootfs.ext4
dd bs=1 if=/dev/zero of=misc.img count=16
fastboot flash MISC misc.img
fastboot reboot
rm -rf BOOT RECOVERY misc.img
```

PSCRecovery.ps1
```
mkdir "BOOT","RECOVERY"
Rename-Item LBOOT.EPB LBOOT.EPB.zip
Expand-Archive LBOOT.EPB.zip -DestinationPath "BOOT"
Rename-Item LRECOVERY.EPB LRECOVERY.EPB.zip
Expand-Archive LRECOVERY.EPB.zip -DestinationPath "RECOVERY"
.\fastboot.exe flash BOOTIMG1 BOOT\boot.img
.\fastboot.exe flash TEE1 BOOT\tz.img
.\fastboot.exe flash ROOTFS1 BOOT\rootfs.ext4
.\fastboot.exe flash USRDATA BOOT\userdata.ext4
.\fastboot.exe flash BOOTIMG2 RECOVERY\boot.img
.\fastboot.exe flash TEE2 RECOVERY\tz.img
.\fastboot.exe flash ROOTFS2 RECOVERY\rootfs.ext4
.\fastboot.exe flash MISC misc.img
.\fastboot.exe reboot
rm "BOOT","RECOVERY"
Rename-Item LBOOT.EPB.zip LBOOT.EPB
Rename-Item LRECOVERY.EPB.zip LRECOVERY.EPB
```
