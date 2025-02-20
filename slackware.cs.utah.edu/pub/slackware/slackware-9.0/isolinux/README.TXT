
To make a bootable Slackware install CD, get into the top level Slackware
directory (The one with ChangeLog.txt in it) and issue a command like this
to build the ISO image in /tmp:

mkisofs -o /tmp/slackware.iso \
-R -J -V "Slackware Install" \
-x ./bootdisks \
-x ./extra \
-x ./slackware/gnome \
-x ./pasture \
-x ./rootdisks \
-x ./source \
-x ./zipslack \
-hide-rr-moved \
-v -d -N -no-emul-boot -boot-load-size 32 -boot-info-table \
-sort isolinux/iso.sort \
-b isolinux/isolinux.bin \
-c isolinux/isolinux.boot \
-A "Slackware Install CD" . 

Then use 'cdrecord' to burn it.  (See 'man cdrecord')

Notice that to fit the install image on one CD, you must exclude GNOME:

-x ./slackware/gnome \

or exclude KDE:

-x ./slackware/kde \
-x ./slackware/kdei \

or, leave them both off:

-x ./slackware/gnome \
-x ./slackware/kde \
-x ./slackware/kdei \

or, leave off the KDEI series (KDE translations):

-x ./slackware/kdei \

You decide. :-)

----
notes:
   The isolinux/isolinux.boot file will be created on the CD;  it's not
   supposed to be in the source tree.  I mention this only because so many
   people reported the "missing" isolinux/isolinux.boot file as a bug.

  I don't know how to create a bootable Slackware ISO on operating systems
  other than Linux, but it should be easy to burn the Linux-created ISO with
  most CD burning software on any operating system.

  UPDATE:  I've now been informed that there's a Windows version of mkisofs
  available from ftp://ftp.fokus.gmd.de/pub/unix/cdrecord/alpha if you want
  to try to make the ISO image under Windows.  I haven't tried this.

