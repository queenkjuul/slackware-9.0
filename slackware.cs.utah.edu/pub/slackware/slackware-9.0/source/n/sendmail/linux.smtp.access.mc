include(`../m4/cf.m4')
VERSIONID(`linux for smtp-only setup')dnl
OSTYPE(linux)
FEATURE(always_add_domain)dnl
FEATURE(`access_db', `hash -T<TMPF> /etc/mail/access')
MAILER(local)dnl
MAILER(smtp)dnl
