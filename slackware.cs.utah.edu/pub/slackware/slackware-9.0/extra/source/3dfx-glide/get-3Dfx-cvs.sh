#!/bin/sh
#
# Logs in to the 3Dfx CVS server and checks out copies of
# Device3Dfx, glide2x, glide3x, and swlibs
#
# Last modified 23-Jan-2001 by David Cantrell (david@slackware.com)
#

rm -rf Device3Dfx glide2x glide3x swlibs

echo "This is just a formality, you can safely hit ENTER for the password."
cvs -d:pserver:anonymous@cvs.glide.sourceforge.net:/cvsroot/glide login
for modname in Device3Dfx glide2x glide3x swlibs
do
   cvs \
      -z9 \
      -d:pserver:anonymous@cvs.glide.sourceforge.net:/cvsroot/glide \
      checkout $modname
done
find . -type d -name CVS -exec rm -rf {} \;
for modname in Device3Dfx glide2x glide3x swlibs
do
   if [ -d $modname ]
   then
      tar cvzf $modname.tar.gz $modname
      rm -rf $modname
   fi
done

# Fix permissions
chmod 644 Device3Dfx.tar.gz
chmod 644 glide3x.tar.gz
chmod 644 glide2x.tar.gz
chmod 644 swlibs.tar.gz

# Put the sources in their correct locations
mv Device3Dfx.tar.gz dev3dfx/Device3Dfx.tar.gz
mv glide3x.tar.gz voodoo3_banshee/glide_h3-3.10/glide3x.tar.gz
mv glide2x.tar.gz voodoo3_banshee/glide_h3-2.60/glide2x.tar.gz
mv swlibs.tar.gz voodoo3_banshee/glide_h3-3.10/swlibs.tar.gz
