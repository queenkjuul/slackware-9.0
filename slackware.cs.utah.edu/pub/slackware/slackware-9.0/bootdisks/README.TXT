These are 1.44 MB bootdisk images for Slackware Linux 9.0.

These disks use Linux kernel version 2.4.20.

If you are unable to boot the Slackware CD directly, then you'll need one of
these to get Linux started on your system so that you can install it.
There are many bootdisks to support a wide variety of hardware -- read the
details below to select the one that's right for your machine.

You will be using the bootdisk to load the installation rootdisks, or a
rescue disk image.  See the /rootdisks directory for these.

A bootdisk is created by writing the image to a formatted floppy disk
with RAWRITE.EXE under DOS.  For example, to use RAWRITE.EXE to create the
bare.i bootdisk you'd put a formatted disk in your floppy drive and issue
the following command:

C:\> RAWRITE BARE.I A:

*******************************************************************************
* Tip:  If you have no idea which bootdisk to use, start with "bare.i".  This *
*       is the correct disk to use for most systems with IDE peripherals.     *
*******************************************************************************

--------------------------------------------------------------------------------

Here's a description of the disks:

 These are the bootdisks for IDE based systems.  All IDE bootdisks support
 IDE hard drives and CD-ROM drives, plus additional support listed below.

    bare.i             This is the disk to use for installation on most IDE
                       based PCs, with support for nearly all IDE controllers
                       and support for IDE/ATAPI CD-ROM/DVD drives.
                       Most CD-ROM drives made today fall into this category.

    ataraid.i          This is a bootdisk with support for IDE RAID controllers.
                       The install disks now have preliminary support for these
                       controllers as well.  The drivers included are:
                         3ware Hardware ATA-RAID controllers.
                         Promise Fasttrak(tm) IDE RAID.
                       Many of these controllers will require some degree of
                       do-it-yourself setup before and/or after installation.
  
    lowmem.i           This is a really stripped-down Linux kernel which might
                       be useful for installing on IDE systems with a low
                       amount of RAM (less than 8MB).  It's also the only
                       Slackware kernel that supports old 386 machines.
                       If bare.i runs into problems, you might try this.
                       NOTE:  On systems with extremely low memory (4MB),
                       ZipSlack plus the fourmeg.zip add-on (found in the
                       zipslack directory) may boot and run even in cases
                       where lowmem.i doesn't.  If you have to use lowmem.i to
                       install, you'll then probably have to compile a custom
                       kernel with the minimal additional features that your
                       machine requires.

    old_cd.i           This is a version of bare.i with additional support
                       for old CD-ROM drives on non-standard proprietary
                       interfaces.  The CD-ROM drives supported by this
                       bootdisk are:
                       Aztech CDA268-01A, Orchid CD-3110, Okano/Wearnes CDD110,
                         Conrad TXC, CyCDROM CR520, CR540.
                       Sony CDU31/33a CD-ROM.
                       Sony CDU531/535 CD-ROM.
                       Philips/LMS cm206 CD-ROM with cm260 adapter card.
                       Goldstar R420 CD-ROM  (sometimes sold in a 'Reveal
                       Multimedia Kit').
                       ISP16/MAD16/Mozart CD-ROM drives.
                         (Boot time command line options (or 'append=' options
                         in /etc/lilo.conf) are:
                           isp16=<port>,<irq>,<dma>,<drive_type>
                         Valid values for drive_type include: Sanyo, Panasonic
                         (same as Sanyo), Sony and Mitsumi.  Default values are:
                         port=0x340, irq=0, dma=0, drive_type=Sanyo.)
                       NON-IDE Mitsumi CD-ROM support.
                       Optics Storage 8000 AT CD-ROM (the 'DOLPHIN' drive).
                       Sanyo CDR-H94A CD-ROM support.
                       Matsushita, Kotobuki, Panasonic, CreativeLabs 
                       (Sound Blaster), Longshine and Teac NON-IDE CD-ROM
                       support.

    pportide.i         This is an extended version of bare.i with support for
                       a wide variety of parallel-port IDE devices.  Supports
                       parallel-port products from MicroSolutions, 
                       Hewlett-Packard, SyQuest, Imation, Avatar, and other
                       manufacturers.


    speakup.i          This is like the bare.i (standard IDE) disk, but has
                       support for Speakup.  Speakup provides access to Linux
                       for the visually impaired community.  It does this by
                       sending console output to a number of different
                       hardware speech synthesizers.  It provides access to
                       Linux by making screen review functions available.
                       For more information about speakup and its drivers
                       check out http://www.linux-speakup.org.
                       To use this, you'll need to specify one of the
                       supported synthesizers on the bootdisk's boot prompt:
                           ramdisk speakup_synth=synth
                       where 'synth' is one of the supported speech
                       synthesizers:  
                         acntpc, acntsa, apolo, audptr, bns, decext, dectlk,
                         dtlk, ltlk, spkout, txprt


    xfs.i              This is an extended version of bare.i with support for
                       SGI's XFS filesystem.  If you use this, you'll also
                       need the special kernel modules package found in the
                       extra/ packages collection.


  The bootdisks listed below are for systems that contain a SCSI controller.
  All SCSI bootdisks feature full IDE hard drive and CD-ROM drive support,
  plus additional SCSI drivers.  

    adaptec.s          This bootdisk supports most Adaptec SCSI controllers,
                       including these models:
                       AHA-1510, AHA-1520, AHA-1522, AHA-1522, AHA-1740,
                       and AHA-2825.  The AIC7xxx models, which include the
                       274x EISA cards; 284x VLB cards; 2902, 2910, 293x,
                       294x, 394x, 3985 and several other PCI and motherboard
                       based SCSI controllers from Adaptec.  

    ibmmca.s           This is a bootdisk based on a development kernel which
                       supports MicroChannel Architecture, found in some IBM 
                       PS/2 machines and laptops. It is a bus system similar to
                       PCI or ISA.  Support for most MCA SCSI, Ethernet, and
                       Token Ring adapters is included.

    jfs.s              A version of bare.i with support for IBM's Journaled
                       Filesystem as well as Adaptec AIC7xxx SCSI support.

    raid.s             This is a bootdisk with support for some hardware SCSI
                       and ATA RAID controllers.  The install disks now have
                       preliminary support for these controllers as well.  The
                       drivers included are:
                         3ware Hardware ATA-RAID controllers.
                         Adaptec's I2O based RAID controllers (including OEM
                           Adaptec RAID controllers used by HP and Dell,
                           Adaptec branded AAC964/5400 RAID controllers,
                           and DPT SmartRaid V cards)
                         AMI MegaRAID 418, 428, 438, 466, 762, 490
                         and 467 SCSI host adapters.
                         Compaq Smart Array controllers.
                         Compaq Smart Array 5xxx controllers.
                         IBM ServeRAID hardware RAID controllers.
                         LSI Logic Fusion(TM) MPT devices (not really RAID, but
                           added since there was room for this driver here)
                         Mylex DAC960, AcceleRAID, and eXtremeRAID controllers.
                       Many of these controllers will require some degree of
                       do-it-yourself setup before and/or after installation.

    scsi.s             This is a SCSI bootdisk with support for various
                       controllers.  Note that this disk does not include
                       Adaptec support any longer -- you must use the adaptec.s
                       bootdisk for that.
                       This disk supports these SCSI controllers:
                         AdvanSys SCSI support (supports all AdvanSys SCSI
                           controllers, including some SCSI cards included with
                           HP CD-R/RW drives, the Iomega Jaz Jet SCSI controller,
                           and the SCSI controller on the Iomega Buz multimedia
                           adapter)
                         AM53/79C974 PCI SCSI support
                         BusLogic SCSI support
                         EATA ISA/EISA/PCI (DPT and generic EATA/DMA-compliant
                           boards) support
                         Generic NCR5380/53c400 SCSI support
                         Initio 91XXU(W) and Initio 91XXU(W) support
                         NCR53c406a SCSI support
                         NCR53c7,8xx SCSI support
                         SYM53C8XX Version 2 SCSI support
                         Qlogic ISP SCSI support
                         Qlogic QLA 1280 SCSI support

    scsi2.s            This is a SCSI bootdisk with support for various
                       controllers not supported by scsi.s.
                       This disk supports these SCSI controllers:
                         Western Digital 7000FASST SCSI support
                         ACARD 870U/W SCSI host adapter support
                         Always IN2000 SCSI support
                         Compaq Fibre Channel 64-bit/66Mhz HBA support
                         Domex DMX3191D SCSI Host Adapters
                         DTC 3180/3280 SCSI Host Adapters
                         EATA-DMA [Obsolete] (DPT, NEC, AT&T, SNI, AST,
                           Olivetti, Alphatronix) support 
                         EATA-PIO (old DPT PM2001, PM2012A) support
                         Future Domain 16xx SCSI/AHA-2920A support
                         Intel/ICP (former GDT SCSI Disk Array) RAID
                           Controller support
                         NCR53c710 based SCSI host adapters
                         NCR53C8XX SCSI support
                         PAS16 SCSI support
                         PCI2000I EIDE interface card
                         PCI2220i EIDE interface card
                         PSI240i EIDE interface card
                         Qlogic FAS SCSI support
                         QLogic ISP FC (ISP2100 SCSI-FCP) support
                         Seagate ST01/ST02, Future Domain TMC-885/950 SCSI
                           support.
                         SYM53c416 SCSI host adapter
                         Tekram DC390(T), DawiControl 2974 and some onboard
                           PCnet (Am53/79C974) controllers based on the
                           Am53C974A chipset
                         UltraStor 14F, 24F and 34F SCSI-2 host adapters


---------------------------------------------------------------------------------
IMPORTANT HELPFUL HINTS: (AND WHAT TO DO IF THE INSTALLED SYSTEM WON'T BOOT)

If the system doesn't boot after installation, but the installation itself
worked, the usual reason is that a different kernel was installed than what was
used for the installation.  Basically, any time you use one kernel to install,
and a different kernel the first time the installed system is started, you run
the risk that the second kernel won't be compatible for some reason.  

If this happens, don't panic.  You can probably use the same bootdisk or CD that
you installed with to start your system now.  Just boot, and on the "boot:"
prompt tell the kernel to mount your root partition:

  mount root=/dev/hdb1

On a similar note, here's how to compile and install a new kernel.  You might
want to do this anyway, since a custom compiled kernel containing only the
drivers your system requires and optimized for your CPU will offer optimal
performance.  You'll also need to recompile your kernel to enable support for
certain drivers like ACPI (too large to include in the standard build), or to
enable SMP (Symmetric Multi-Processing, or support for multiple CPUs).

To compile a custom kernel, follow these steps:

0. If you haven't installed the C compiler and kernel source, do that.

1. If you have to, use the bootdisk/CD you installed with to start your machine.
   At the LILO prompt, enter: 
   
     mount root=/dev/hda1
                ^^^^^^^^^ Or whatever your root Linux partition is.

   Ignore any error messages as the system starts up.

2. Log in as root, and recompile the kernel with these steps. (Comments will be
   placed in parenthesis) 

   cd /usr/src/linux

   make menuconfig    Choose your drivers. Repeat this step until you are
                      satisfied with your choices.  Note that menuconfig gets
                      its defaults from .config, which as supplied contains the
                      choices used to compile the bare.i kernel.  If you wish
                      to recreate some other Slackware kernel (and maybe tweak
                      the choices a little), then you'll need to copy the
                      appropriate config file over .config before you run
                      menuconfig.  For example, you could copy the defaults for
                      the adaptec.s kernel:
                        cp kernels/adaptec.s/config /usr/src/linux/.config
                      The "kernels" directory is usually found on the Slackware
                      installation CD, or on the Slackware FTP site.
   
   If you are using LILO, here's how to build and install the new kernel:

     First, build the kernel:

     make dep ; make clean ; make bzImage

     Then, install the new kernel in /boot:

     cp arch/i386/boot/bzImage /boot/vmlinuz

     And also the System.map:

     cp System.map /boot

     Finally, reinstall LILO:

     lilo

   If you are using a bootdisk, then installing the kernel in /boot is optional.
   To make a bootdisk from the newly built kernel, use the makebootdisk command:

     makebootdisk arch/i386/boot/bzImage

That should do it!  You should now have a Linux kernel that can make full use of
all supported hardware installed in your machine.  Reboot and try it out.

Good luck!

---
Patrick Volkerding
volkerdi@slackware.com

PS - Bug reports welcome.  Requests for help may be answered if time permits.
     I've been happy to do this in the past, but lately I've had both a lot 
     more work to do and a lot more mail to deal with.  It's just not as 
     possible to keep up with my mail as it once was.
