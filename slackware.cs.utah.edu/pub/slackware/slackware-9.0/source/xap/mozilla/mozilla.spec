%define _unpackaged_files_terminate_build 0
%define toolkit_options --disable-freetype2 --enable-xft
%define builddir %{_builddir}/mozilla
%define gcc_32_libs no

Name:        mozilla
Summary:     Web browser and mail reader
Version:     1.3
Release:     0_xft
Serial:      35
Copyright:   MPL
Source0:     mozilla-source-1.3.tar.bz2
Source1:     mozilla.sh.in
Source2:     mozilla-icon.png
Source4:     mozilla.desktop
Source7:     mozilla-make-package.pl
Source9:     mozicon16.xpm
Source10:    mozicon50.xpm
Source11:    mozilla-rebuild-databases.pl.in
Source12:    mozilla-mail.desktop
Source13:    mozilla-mail-icon.gif
Source14:    mozilla-compose.desktop
Source15:    mozilla-compose-icon.gif
Source18:    mozilla-xpcom-exclude-list
#Source19:    mozilla-redhat-default-bookmarks.html
Source20:    mozilla-1.2.1-xft-prefs.js
#Patch0:      mozilla-navigator-overlay-menu.patch
#Patch1:      mozilla-editor-overlay-menu.patch
#Patch6:      mozilla-prefs-debug.patch
#Patch7:      mozilla-redhat-home-page.patch
#Patch8:      mozilla-redhat-mail-home-page.patch
Patch11:     mozilla-taskbar-nomozilla.patch
Patch12:     mozilla-psfonts-7.2.patch
Patch13:     mozilla-nspr-packages.patch
Patch14:     mozilla-default-plugin-less-annoying.patch
#Patch17:     mozilla-buildid-title.patch
Patch18:     mozilla-1.2.1-uifont.patch
Patch20:     mozilla-1.2.1-xft-font-prefs.patch

Buildroot:   /var/tmp/mozilla-root
Prefix:      /usr
Group:       Applications/Internet
Provides:    webclient
# Removed compat-gcc-c++, compat-libstdc++-devel, compat-gcc
BuildPrereq: libpng-devel, libjpeg-devel, zlib-devel, zip, perl, autoconf, indexhtml, ORBit-devel, glib-devel, gtk+-devel
Prereq:      fileutils perl
Prereq:      /usr/bin/killall
Requires:    mozilla-nspr = %{version}-%{release}, indexhtml
ExclusiveArch: i386 s390 s390x x86_64 ppc

%description
Mozilla is an open-source web browser, designed for standards
compliance, performance and portability.

%package nspr
Summary: Netscape Portable Runtime
Group: Applications/Internet
Conflicts: mozilla < 0.9.9

%description nspr
NSPR provides platform independence for non-GUI operating system
facilities. These facilities include threads, thread synchronization,
normal file and network I/O, interval timing and calendar time, basic
memory management (malloc and free) and shared library linking.

%package nspr-devel
Summary: Development Libraries for the Netscape Portable Runtime
Group: Development/Libraries
Requires: mozilla-nspr = %{version}-%{release}

%description nspr-devel
Header files for doing development with the Netscape Portable Runtime.

%package nss
Summary: Network Security Services
Group: Applications/Internet
Requires: mozilla-nspr = %{version}-%{release}

%description nss
Network Security Services (NSS) is a set of libraries designed to
support cross-platform development of security-enabled server
applications. Applications built with NSS can support SSL v2 and v3,
TLS, PKCS #5, PKCS #7, PKCS #11, PKCS #12, S/MIME, X.509 v3
certificates, and other security standards.

%package nss-devel
Summary: Development Libraries for Network Security Services
Group: Applications/Internet
Requires: mozilla-nss-devel = %{version}-%{release}

%description nss-devel
Header files to doing development with Network Security Services.

%package devel
Summary: Development files for Mozilla
Group: Development/Libraries
Requires: mozilla = %{version}-%{release}

%description devel
Development header files for mozilla.

%package mail
Summary: Mozilla-based mail system
Group: Applications/Internet
Prereq:      fileutils mozilla = %{version}-%{release}

%description mail
Mail/news client based on the Mozilla web browser.  The mail/news
client supports IMAP, POP, and NNTP and has an easy to use interface.

%package psm
Summary: Personal Security Manager
Group: Applications/Internet
Prereq:      fileutils mozilla = %{version}-%{release} mozilla-nss = %{version}-%{release}

%description psm
The Personal Security Manager is a set of libraries that allow Mozilla
to talk to the Network Security Services layer.  It allows Mozilla to
access SSL web sites and manage cryptographic keys.

%package chat
Summary: IRC client integrated with Mozilla
Group: Applications/Internet
Prereq: fileutils mozilla = %{version}-%{release}

%description chat
IRC client that is integrated with the Mozilla web browser.

%package js-debugger
Summary: JavaScript debugger for use with Mozilla
Group: Applications/Internet
Prereq: fileutils mozilla = %{version}-%{release}

%description js-debugger
JavaScript debugger for use with Mozilla.

%package dom-inspector
Summary: A tool for inspecting the DOM of pages in Mozilla.
Group: Applications/Internet
Prereq: fileutils mozilla = %{version}-%{release}

%description dom-inspector
This is a tool that allows you to inspect the DOM for web pages in
Mozilla.  This is of great use to people who are doing Mozilla chrome
development or web page development.

%prep

%setup -q -n mozilla

#%patch0 -p1
#%patch0 -p1 -R

#%patch1 -p1
#%patch1 -p1 -R

#%patch6 -p1
#%patch6 -p1 -R

#%patch7 -p1
#%patch7 -p1 -R

#%patch8 -p1
#%patch8 -p1 -R

%patch11 -p1
%patch11 -p1 -R

# Can't hurt to leave this in since the defaults are empty.
%patch12 -p1

%patch13 -p1

# make the plugin dialog less annoying and disable redirection to the
# plugin downloader page.
%patch14 -p1

# remove the annoying buildid from the titlebar
#%patch17 -p1
#%patch17 -p1 -R

# make it possible to set the uifont
%patch18 -p1

# patch to make it possible to use the font prefs with xft in a sane
# manner
%patch20 -p1

## set up our default bookmarks
#/bin/cp %{SOURCE19} $RPM_BUILD_DIR/mozilla/profile/defaults/bookmarks.html

%build

if [ -x /usr/bin/getconf ]; then
  CPUS=`getconf _NPROCESSORS_ONLN`
fi
if test "x$CPUS" = "x" -o "x$CPUS" = "x0"; then
  CPUS=1
fi

# build mozilla
BUILD_OFFICIAL=1 MOZILLA_OFFICIAL=1 \
	./configure --prefix=%{_prefix} --libdir=%{_libdir} --enable-optimize \
	--disable-debug \
	--with-default-mozilla-five-home=%{_libdir}/mozilla-%{version} \
	--enable-strip-libs \
	--disable-tests \
	--disable-short-wchar \
	--enable-nspr-autoconf \
	--enable-extensions=default,irc \
	--without-mng \
	--enable-crypto \
	--disable-xprint \
	--without-system-nspr \
	--with-system-zlib \
	%{toolkit_options} \
	--mandir=%{_mandir}


BUILD_OFFICIAL=1 MOZILLA_OFFICIAL=1 make -s export
BUILD_OFFICIAL=1 MOZILLA_OFFICIAL=1 make -j$CPUS -s libs

%install
/bin/rm -rf $RPM_BUILD_ROOT

BUILD_OFFICIAL=1 MOZILLA_OFFICIAL=1 \
	DESTDIR=$RPM_BUILD_ROOT \
	make install

# create a list of all of the different package and the files that
# will hold them

/bin/rm -f %{builddir}/mozilla.list
/bin/rm -f %{builddir}/mozilla-mail.list
/bin/rm -f %{builddir}/mozilla-psm.list
/bin/rm -f %{builddir}/mozilla-chat.list
/bin/rm -f %{builddir}/mozilla-js-debugger.list
/bin/rm -f %{builddir}/mozilla-dom-inspector.list

# NSS and NSPR are both installed into /usr/lib instead of
# /usr/lib/mozilla-VERSION

pushd .
cd $RPM_BUILD_ROOT%{_libdir}/mozilla-%{version}
# copy nspr
mv -v \
  libnspr4.so libplc4.so libplds4.so \
  $RPM_BUILD_ROOT%{_libdir}/

popd

/bin/rm -f %{builddir}/mozilla-nspr.list
%{SOURCE7} --package nspr --output-file %{builddir}/mozilla-nspr.list \
    --package-file $RPM_BUILD_DIR/mozilla/xpinstall/packager/packages-unix \
    --install-dir $RPM_BUILD_ROOT/%{_libdir} \
    --install-root %{_libdir}

/bin/rm -f %{builddir}/mozilla-nss.list
%{SOURCE7} --package nss --output-file %{builddir}/mozilla-nss.list \
    --package-file $RPM_BUILD_DIR/mozilla/xpinstall/packager/packages-unix \
    --install-dir $RPM_BUILD_ROOT/%{_libdir} \
    --install-root %{_libdir}

# build all of the default browser components
# base mozilla package (mozilla.list)
%{SOURCE7} --package langenus --output-file %{builddir}/mozilla.list \
    --package-file $RPM_BUILD_DIR/mozilla/xpinstall/packager/packages-unix \
    --install-dir $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version} \
    --install-root %{_libdir}/mozilla-%{version}

%{SOURCE7} --package regus --output-file %{builddir}/mozilla.list \
    --package-file $RPM_BUILD_DIR/mozilla/xpinstall/packager/packages-unix \
    --install-dir $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version} \
    --install-root %{_libdir}/mozilla-%{version}

%{SOURCE7} --package deflenus --output-file %{builddir}/mozilla.list \
    --package-file $RPM_BUILD_DIR/mozilla/xpinstall/packager/packages-unix \
    --install-dir $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version} \
    --install-root %{_libdir}/mozilla-%{version}

%{SOURCE7} --package xpcom --output-file %{builddir}/mozilla.list \
    --package-file $RPM_BUILD_DIR/mozilla/xpinstall/packager/packages-unix \
    --install-dir $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version} \
    --install-root %{_libdir}/mozilla-%{version} \
    --exclude-file=%{SOURCE18}

%{SOURCE7} --package browser --output-file %{builddir}/mozilla.list \
    --package-file $RPM_BUILD_DIR/mozilla/xpinstall/packager/packages-unix \
    --install-dir $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version} \
    --install-root %{_libdir}/mozilla-%{version} \

# mozilla mail (mozilla-mail.list)
%{SOURCE7} --package mail --output-file %{builddir}/mozilla-mail.list \
    --package-file $RPM_BUILD_DIR/mozilla/xpinstall/packager/packages-unix \
    --install-dir $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version} \
    --install-root %{_libdir}/mozilla-%{version}

# mozilla psm (mozilla-psm.list)
%{SOURCE7} --package psm --output-file %{builddir}/mozilla-psm.list \
    --package-file $RPM_BUILD_DIR/mozilla/xpinstall/packager/packages-unix \
    --install-dir $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version} \
    --install-root %{_libdir}/mozilla-%{version} \

# mozilla chat (mozilla-chat.list)
%{SOURCE7} --package chatzilla --output-file %{builddir}/mozilla-chat.list \
    --package-file $RPM_BUILD_DIR/mozilla/xpinstall/packager/packages-unix \
    --install-dir $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version} \
    --install-root %{_libdir}/mozilla-%{version}

# mozilla JS debugger (mozilla-js-debugger.list)
%{SOURCE7} --package venkman --output-file %{builddir}/mozilla-js-debugger.list \
    --package-file $RPM_BUILD_DIR/mozilla/xpinstall/packager/packages-unix \
    --install-dir $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version} \
    --install-root %{_libdir}/mozilla-%{version}

# mozilla DOM inspector (mozilla-dom-inspector.list)
%{SOURCE7} --package inspector --output-file %{builddir}/mozilla-dom-inspector.list \
    --package-file $RPM_BUILD_DIR/mozilla/xpinstall/packager/packages-unix \
    --install-dir $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version} \
    --install-root %{_libdir}/mozilla-%{version}

# build our initial component and chrome registry


pushd `pwd`
  cd $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version}

  # save a copy of the default installed-chrome.txt file before we
  # muck with it
  mkdir chrome/lang
  cp chrome/installed-chrome.txt chrome/lang/

  # register our components
  LD_LIBRARY_PATH=`pwd`:`pwd`/.. MOZILLA_FIVE_HOME=`pwd` ./regxpcom

  # set up the default skin and locale to trigger the generation of
  # the user-locales and users-skins.rdf
  echo "skin,install,select,classic/1.0" >> chrome/installed-chrome.txt
  echo "locale,install,select,en-US" >> chrome/installed-chrome.txt

  # save the defaults in a file that will be used later to rebuild the
  # installed-chrome.txt file
  echo "skin,install,select,classic/1.0" >> chrome/lang/default.txt
  echo "locale,install,select,en-US" >> chrome/lang/default.txt

  # set up the chrome rdf files
  LD_LIBRARY_PATH=`pwd`:`pwd`/.. MOZILLA_FIVE_HOME=`pwd` ./regchrome

  # fix permissions of the chrome directories
  /usr/bin/find . -type d -perm 0700 -exec chmod 755 {} \; || :
popd

# cp -L (dereference all symlinks) is required for fileutils >= 2.0.27
# (POSIX compliance); prior versions don't understand -L, so fall back...

# copy the nss files to the right place
mkdir $RPM_BUILD_ROOT/%{prefix}/include/mozilla-%{version}/nss/

/usr/bin/find security/nss/lib/ -name '*.h' -type f -exec /bin/cp {} \
 $RPM_BUILD_ROOT/%{prefix}/include/mozilla-%{version}/nss/ \;

# build the list of include files
rm -f %{builddir}/mozilla-devel.list
rm -f %{builddir}/mozilla-nss-devel.list
rm -f %{builddir}/mozilla-nspr-devel.list

find $RPM_BUILD_ROOT/%{prefix}/include/mozilla-%{version}/ -type f | \
  sed -e "s,$RPM_BUILD_ROOT,," | \
  grep -v "/%{prefix}/include/mozilla-%{version}/nss" | \
  grep -v "/%{prefix}/include/mozilla-%{version}/nspr" > \
  %{builddir}/mozilla-devel.list

# we only include the libs file if we need the gcc_32_libs is set to
# true
if [ "%gcc_32_libs" == "yes" ]; then
  echo %{_libdir}/mozilla-%{version}/mozilla-gcc-3.2-libs.tar.bz2 >> \
      %{builddir}/mozilla-devel.list
fi

find $RPM_BUILD_ROOT/%{prefix}/include/mozilla-%{version}/ -type f | \
  sed -e "s,$RPM_BUILD_ROOT,," | \
  grep "/%{prefix}/include/mozilla-%{version}/nspr" > \
  %{builddir}/mozilla-nspr-devel.list

find $RPM_BUILD_ROOT/%{prefix}/include/mozilla-%{version}/ -type f| \
  sed -e "s,$RPM_BUILD_ROOT,," | \
  grep "/%{prefix}/include/mozilla-%{version}/nss" > \
  %{builddir}/mozilla-nss-devel.list

# copy our idl into place
#mkdir -p $RPM_BUILD_ROOT/%{prefix}/share/idl/mozilla-%{version}
#(cd dist/idl ; tar chf - * | \
#  (cd $RPM_BUILD_ROOT/%{prefix}/share/idl/mozilla-%{version} ; \
#   tar xvf -))

# copy our devel tools
install -c -m 755 dist/bin/xpcshell \
  dist/bin/xpidl \
  dist/bin/xpt_dump \
  dist/bin/xpt_link \
  $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version}

# set up our desktop files
/bin/mkdir -p $RPM_BUILD_ROOT/%{prefix}/share/pixmaps/
/bin/mkdir -p $RPM_BUILD_ROOT/usr/share/gnome/apps/Internet

install -c -m 644 %{SOURCE2} %{SOURCE13} %{SOURCE15} \
  $RPM_BUILD_ROOT/%{prefix}/share/pixmaps/

install -c -m 644  %{SOURCE4} %{SOURCE12} %{SOURCE14} \
  $RPM_BUILD_ROOT/usr/share/gnome/apps/Internet

if [ ! -d $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version}/icons/ ]; then
  mkdir -m 755 $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version}/icons
fi

if [ ! -d $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version}/plugins/ ]; then
  mkdir -m 755 $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version}/plugins
fi

## our icons are better!
#install -c -m 644 %{SOURCE9} $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version}/icons/
#install -c -m 644 %{SOURCE10} $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version}/icons/

# install our mozilla.sh file
cat %{SOURCE1} | sed -e 's/MOZILLA_VERSION/%{version}/g' \
		     -e 's,LIBDIR,%{_libdir},g' > \
  $RPM_BUILD_ROOT/usr/bin/mozilla

chmod 755 $RPM_BUILD_ROOT/usr/bin/mozilla

# install our rebuild file
cat %{SOURCE11} | sed -e 's/MOZILLA_VERSION/%{version}/g' \
		      -e 's,LIBDIR,%{_libdir},g' > \
  $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl

chmod 755 \
  $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl

# install the defaults fonts for xft
cp %{SOURCE20} $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version}/defaults/pref/xft.js

# install the gre.conf file
#echo [%{version}] > \
#  $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version}/gre.conf
#echo GRE_PATH=%{_libdir}/mozilla-%{version} >> \
#  $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version}/gre.conf
#echo [%{version}] > \
#  $RPM_BUILD_ROOT/etc/gre.conf
#echo GRE_PATH=%{_libdir}/mozilla-%{version} >> \
#  $RPM_BUILD_ROOT/etc/gre.conf

if [ "%gcc_32_libs" == "yes" ]; then
  make distclean

  if [ -x /usr/bin/getconf ]; then
    CPUS=`getconf _NPROCESSORS_ONLN`
  fi
  if test "x$CPUS" = "x" -o "x$CPUS" = "x0"; then
    CPUS=1
  fi

  # build mozilla with the default compiler
  CC=gcc CXX=g++ \
  BUILD_OFFICIAL=1 MOZILLA_OFFICIAL=1 \
    ./configure --prefix=%{_prefix} --libdir=%{_libdir} --enable-optimize \
      --disable-debug \
      --with-default-mozilla-five-home=/%{_libdir}/mozilla-%{version}/gcc-3.2 \
      --enable-strip-libs \
      --disable-tests \
      --disable-short-wchar \
      --enable-nspr-autoconf \
      --enable-extensions=default,irc \
      --without-mng \
      --enable-crypto \
      --disable-xprint \
      --without-system-nspr \
      --with-system-zlib \
      %{toolkit_options} \
      --enable-old-abi-compat-wrappers \
      --mandir=%{_mandir}

  BUILD_OFFICIAL=1 MOZILLA_OFFICIAL=1 make export
  BUILD_OFFICIAL=1 MOZILLA_OFFICIAL=1 make -j$CPUS libs

  mkdir -p gcc-3.2/components
  for i in libembed_base_s.a libmozreg_s.a libmozjs.so libmsgbaseutil.so \
    libnspr4.so libplc4.so libplds4.so libxpcom.so \
    libldap50.so libprldap50.so components/libabsyncsvc.so \
    components/libaddrbook.so components/libmork.so \
    components/libnecko.so components/libpref.so \
    components/libprofile.so components/librdf.so \
    components/liburiloader.so \
    components/libxpconnect.so components/libmozldap.so \
    components/libuconv.so \
    components/libvcard.so; do
      cp -aL dist/lib/$i gcc-3.2/$i
  done

  find gcc-3.2 -name \*.so -exec strip {} \;
  cd gcc-3.2
  tar cf - * | bzip2 -9 > $RPM_BUILD_ROOT/%{_libdir}/mozilla-%{version}/mozilla-gcc-3.2-libs.tar.bz2
  cd ..

fi

%clean
#/bin/rm -rf $RPM_BUILD_ROOT

%post
# run ldconfig before regxpcom
/sbin/ldconfig >/dev/null 2>/dev/null

if [ -f %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl ]; then
    %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl
fi

%postun
/sbin/ldconfig >/dev/null 2>/dev/null
# was this an upgrade?
if [ "$1" == "2" ]; then
  if [ -f %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl ]; then
      %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl
  fi
fi

%triggerpostun -- mozilla < 1.0
# Older packages will leave mozilla unusable after the postun script
# script is run for the old package.  Rebuild the databases after that
# has been run.
if [ -f %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl ]; then
    %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl
fi

%preun
# is a final removal?
if [ "$1" == "0" ]; then
  /bin/rm -rf %{_libdir}/mozilla-%{version}/chrome/overlayinfo
  /bin/rm -f %{_libdir}/mozilla-%{version}/chrome/*.rdf
fi

%post nspr
/sbin/ldconfig >/dev/null 2>/dev/null

%postun nspr
/sbin/ldconfig >/dev/null 2>/dev/null

%post nss
/sbin/ldconfig >/dev/null 2>/dev/null

%postun nss
/sbin/ldconfig >/dev/null 2>/dev/null

%post mail
/sbin/ldconfig >/dev/null 2>/dev/null

if [ -f %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl ]; then
    %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl
fi

%postun mail

# run ldconfig before regxpcom
/sbin/ldconfig >/dev/null 2>/dev/null

if [ -f %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl ]; then
    %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl
fi

%post psm
# run ldconfig before regxpcom
/sbin/ldconfig >/dev/null 2>/dev/null

if [ -f %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl ]; then
    %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl
fi

%postun psm
# run ldconfig before regxpcom
/sbin/ldconfig >/dev/null 2>/dev/null

if [ -f %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl ]; then
    %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl
fi

%post chat
# run ldconfig before regxpcom
/sbin/ldconfig >/dev/null 2>/dev/null

if [ -f %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl ]; then
    %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl
fi

%postun chat
# run ldconfig before regxpcom
/sbin/ldconfig >/dev/null 2>/dev/null

if [ -f %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl ]; then
    %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl
fi

%post js-debugger
# run ldconfig before regxpcom
/sbin/ldconfig >/dev/null 2>/dev/null

if [ -f %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl ]; then
    %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl
fi

%postun js-debugger
# run ldconfig before regxpcom
/sbin/ldconfig >/dev/null 2>/dev/null

if [ -f %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl ]; then
    %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl
fi

%post dom-inspector
# run ldconfig before regxpcom
/sbin/ldconfig >/dev/null 2>/dev/null

if [ -f %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl ]; then
    %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl
fi

%postun dom-inspector
# run ldconfig before regxpcom
/sbin/ldconfig >/dev/null 2>/dev/null

if [ -f %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl ]; then
    %{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl
fi

%files -f mozilla.list
%defattr(-,root,root)
%{prefix}/bin/mozilla
%{_libdir}/mozilla-%{version}/mozilla-rebuild-databases.pl
#/etc/gre.conf
%{prefix}/share/pixmaps/mozilla-icon.png
%{prefix}/share/pixmaps/mozilla-mail-icon.gif
%{prefix}/share/pixmaps/mozilla-compose-icon.gif

%{_libdir}/mozilla-%{version}/defaults/pref/xft.js

%verify (not md5 mtime size) %{_libdir}/mozilla-%{version}/components/compreg.dat
%verify (not md5 mtime size) %{_libdir}/mozilla-%{version}/components/xpti.dat

%dir %{_libdir}/mozilla-%{version}/defaults/pref
%dir %{_libdir}/mozilla-%{version}/defaults/profile/US
%dir %{_libdir}/mozilla-%{version}/defaults/profile
%dir %{_libdir}/mozilla-%{version}/defaults/wallet
%dir %{_libdir}/mozilla-%{version}/defaults/autoconfig
%dir %{_libdir}/mozilla-%{version}/defaults/messenger/US
%dir %{_libdir}/mozilla-%{version}/defaults/messenger
%dir %{_libdir}/mozilla-%{version}/defaults

%dir %{_libdir}/mozilla-%{version}/chrome/icons/default
%dir %{_libdir}/mozilla-%{version}/chrome/icons
%dir %{_libdir}/mozilla-%{version}/chrome/lang
%dir %{_libdir}/mozilla-%{version}/chrome

%dir %{_libdir}/mozilla-%{version}/res/builtin
%dir %{_libdir}/mozilla-%{version}/res/rdf
%dir %{_libdir}/mozilla-%{version}/res/dtd
%dir %{_libdir}/mozilla-%{version}/res/fonts
%dir %{_libdir}/mozilla-%{version}/res

%dir %{_libdir}/mozilla-%{version}/components
%dir %{_libdir}/mozilla-%{version}/icons
%dir %{_libdir}/mozilla-%{version}/searchplugins

%dir %{_libdir}/mozilla-%{version}/plugins
%dir %{_libdir}/mozilla-%{version}/res/html
%dir %{_libdir}/mozilla-%{version}/res/samples
%dir %{_libdir}/mozilla-%{version}/res/entityTables

%dir %{_libdir}/mozilla-%{version}

%{_libdir}/mozilla-%{version}/chrome/lang/installed-chrome.txt
%{_libdir}/mozilla-%{version}/chrome/lang/default.txt

/usr/share/gnome/apps/Internet/mozilla.desktop

%files nspr -f mozilla-nspr.list
%defattr(-,root,root)

%files nspr-devel -f mozilla-nspr-devel.list
%defattr(-,root,root)
%{_libdir}/pkgconfig/*
%{prefix}/bin/mozilla-config

%files nss -f mozilla-nss.list
%defattr(-,root,root)

%files nss-devel -f mozilla-nss-devel.list
%defattr(-,root,root)

%files mail -f mozilla-mail.list
%defattr(-,root,root)
%dir %{_libdir}/mozilla-%{version}/chrome/icons/default
%dir %{_libdir}/mozilla-%{version}/chrome/icons
%dir %{_libdir}/mozilla-%{version}/chrome
%dir %{_libdir}/mozilla-%{version}/components
%dir %{_libdir}/mozilla-%{version}
/usr/share/gnome/apps/Internet/mozilla-mail.desktop
/usr/share/gnome/apps/Internet/mozilla-compose.desktop

%files psm -f mozilla-psm.list
%defattr(-,root,root)

%files chat -f mozilla-chat.list
%defattr(-,root,root)

%files js-debugger -f mozilla-js-debugger.list
%defattr(-,root,root)

%files dom-inspector -f mozilla-dom-inspector.list
%defattr(-,root,root)

%files devel -f mozilla-devel.list
%defattr(-,root,root)
%{prefix}/share/idl/mozilla-%{version}/*
%{_libdir}/mozilla-%{version}/xpcshell
%{_libdir}/mozilla-%{version}/xpidl
%{_libdir}/mozilla-%{version}/xpt_dump
%{_libdir}/mozilla-%{version}/xpt_link

%changelog

