#!/bin/sh
if fgrep usr/openwin/lib etc/ld.so.conf 1> /dev/null 2> /dev/null ; then
 true
else
 echo "/usr/openwin/lib" >> etc/ld.so.conf
fi
