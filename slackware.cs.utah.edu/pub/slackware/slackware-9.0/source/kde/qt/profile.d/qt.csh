#!/bin/csh
# Environment path variables for the Qt package:
if ( ! $?QTDIR ) then
    if ( -d /usr/lib/qt-3.1.2 ) then
        setenv QTDIR /usr/lib/qt-3.1.2
    else
        setenv QTDIR /usr/lib/qt
    endif
endif
set path = ( $path $QTDIR/bin )
if ( $?CPLUS_INCLUDE_PATH ) then
    setenv CPLUS_INCLUDE_PATH $QTDIR/include:$CPLUS_INCLUDE_PATH
else
    setenv CPLUS_INCLUDE_PATH $QTDIR/include
endif
setenv MANPATH ${MANPATH}:$QTDIR/doc/man
