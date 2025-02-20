#!/bin/sh
# Environment variables for the Qt package:
if [ -d /usr/lib/qt-3.1.2 ]; then
  QTDIR=/usr/lib/qt-3.1.2
else
  QTDIR=/usr/lib/qt
fi
if [ ! "$CPLUS_INCLUDE_PATH" = "" ]; then
  CPLUS_INCLUDE_PATH=$QTDIR/include:$CPLUS_INCLUDE_PATH
else
  CPLUS_INCLUDE_PATH=$QTDIR/include
fi
MANPATH="$MANPATH:$QTDIR/doc/man"
PATH="$PATH:$QTDIR/bin"
export QTDIR
export CPLUS_INCLUDE_PATH
export MANPATH
