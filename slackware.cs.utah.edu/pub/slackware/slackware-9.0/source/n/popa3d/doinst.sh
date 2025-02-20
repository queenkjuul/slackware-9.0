#!/bin/sh
# If the pop user/group don't exist, add them:
if grep "pop:x:90:90" etc/passwd 1> /dev/null 2> /dev/null ; then
  true
else
  echo "pop:x:90:90:POP:/:" >> /etc/passwd
fi
if grep "pop::90" etc/group 1> /dev/null 2> /dev/null ; then
  true
else
  echo "pop::90:pop" >> etc/group
fi
