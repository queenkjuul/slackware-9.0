config() {
  NEW="$1"
  OLD="`dirname $NEW`/`basename $NEW .new`"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}
config etc/printcap.new
config etc/lpd.conf.new
config etc/lpd.perms.new

# Fix permissions.  The spool directories have to be owned by lp.lp,
# and spool areas used by samba might need to be chmod 1777 (not done here)
if [ -d var/spool/lpd ]; then
  chown -R lp.lp var/spool/lpd
fi
