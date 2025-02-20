These are root-install disks for Slackware 9.0.

If you are unable to boot the Slackware installation CD directly, you'll
need create these floppy disks in order to load the installer.  In the past,
there's only been one rootdisk floppy called "color.gz", but now there are
2 floppy images (install.1 and install.2), and you'll need both of them.

> Mini FAQ:
> Q.  But I just want something like the old color.gz that I can load
>     as an initrd from the hard drive with LILO, or syslinux, or loadlin.
>
> A.  I think what you're looking for is:  isolinux/initrd.img
>     This is a self contained, gzipped initrd like the old color.gz.

In addition to the install images, you'll also need a bootdisk.  See the
bootdisks directory for those.

To create a floppy disk from one of these images, use the RAWRITE command on
DOS or Windows.  For example, to make the first rootdisk image (install.1),
you'd put a formatted 1.44MB floppy in your floppy drive, and then run this
command:

C:\> RAWRITE INSTALL.1 A:

There are several versions of RAWRITE provided to handle most versions of DOS
and Windows.  If one version doesn't seem to work, try another.

To make the floppy images under Linux, use the "cat" command to send them to
the floppy device.  This command will make the first install disk:

cat install.1 > /dev/fd0

Here's a description of the disk images in this directory:

--------------------------------------------------------------------------------

install.1, install.2:  These are the Slackware installation disks, used
              to install Slackware Linux to its own partition.

              To load the installer from floppy disk, you'll need to write
              each to these to a floppy disk, and use a bootdisk to load them.

              NOTE: The 'dialog' program used by the install system is not
              forgiving of extra keystrokes entered between screens, so type
              carefully.  :-)

There are also these supplemental hardware support disk images, used in
conjunction with the disks above:

pcmcia.dsk    This supplemental disk provides support for laptop devices.  It
              allows installing through a network or CD-ROM drive card.  To
              use this disk to scan for PCMCIA devices (this is only done if
              you need to use them DURING the installation), you enter 'pcmcia'
              after loading the 'install' disks and logging in.

network.dsk   This supplemental disk provides support for ethernet cards. To
              use this disk to scan for network devices (this is only done if
              you need to use them DURING the installation), you enter 'network'
              after loading the 'install' disks and logging in.

There is also a single "rescue" floppy image, since we don't want to be
required to load two rootdisks every time we need to get a Linux prompt from
floppy disks to fix something:

rescue.dsk    This is a BusyBox-based rescue disk for Linux.  It is a
              reasonably complete mini-Linux system running from a four
              megabyte ramdisk, and contains an editor (vi), networking tools
              like ifconfig, route, telnet, ping, and wget, and other tools
              that might be handy for fixing your Linux machine if you ever
              get locked out for some reason, or any time you just need to
              boot Linux to "edit something quickly".

And finally, there is a very small image containing the Smart Boot Manager:

sbootmgr.dsk  This nifty little tool allows selecting various devices to boot
              from a menu, and even allows booting a CD-ROM in machines where
              the BIOS doesn't support it (or it's supposed to support it, but
              it just doesn't work).  If you have trouble booting the
              Slackware CD-ROM, you might try writing this image to a floppy,
              booting it, and then selecting your CD-ROM drive as the boot
              device.  

              The SBM installer is available as a Slackware package (called
              "btmgr") in the extra/ packages collection.

