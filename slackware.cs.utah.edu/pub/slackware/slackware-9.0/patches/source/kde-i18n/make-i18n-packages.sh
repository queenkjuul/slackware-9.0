#!/bin/sh
# Make kde-i18n packages
# by PJV <volkerdi@slackware.com>

export KDEVER=3.1.3
export PKVER=3.1.3
export ARCH=noarch
export BUILD=1

CWD=`pwd`
for file in *.tar.bz2 ; do
  find /opt/kde/share | xargs touch
  find /opt/kde/share | xargs ls -ld > scan.before
  ( tar xjvf $file
    cd $CWD/`basename $file .tar.bz2`
    ./configure --prefix=/opt/kde --program-prefix="" --program-suffix=""
    make -i install
  )
  find /opt/kde/share | xargs ls -ld > scan.after
  cat scan.before scan.after | sort | uniq --unique \
    | grep -v drwx | grep -v crwx | cut -b57- \
    | cut -f 1 -d ' ' | sort | uniq | grep -v /dev/ \
    | grep -v /var/ | tee $CWD/file-list-`basename $file -$KDEVER.tar.bz2`
  # Also add empty directories:
  cat scan.before scan.after | sort | uniq --unique | grep "^d" \
    | cut -b57- | while read dir ; do \
    find $dir -maxdepth 0 -empty -type d; done \
    | sort | uniq --unique >> $CWD/file-list-`basename $file -$KDEVER.tar.bz2`
  mkdir -p $CWD/package-tmp-`basename $file -$KDEVER.tar.bz2`/install
  cat $CWD/slack-desc/slack-desc.`basename $file -$KDEVER.tar.bz2` > $CWD/package-tmp-`basename $file -$KDEVER.tar.bz2`/install/slack-desc
  ( cd $CWD/package-tmp-`basename $file -$KDEVER.tar.bz2`
    tar cvf - --files-from=$CWD/file-list-`basename $file -$KDEVER.tar.bz2` | tar xf -
    makepkg -l y -c n $CWD/`basename $file $KDEVER.tar.bz2`$PKVER-$ARCH-$BUILD.tgz
  )
  rm -r $CWD/`basename $file .tar.bz2`
  rm -r $CWD/package-tmp-`basename $file -$KDEVER.tar.bz2`
  rm -f $CWD/file-list-`basename $file -$KDEVER.tar.bz2`
done
rm -f $CWD/Colors $CWD/scan.before $CWD/scan.after
