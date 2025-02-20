include(`../m4/cf.m4')
VERSIONID(`linux for smtp-only setup')dnl
OSTYPE(linux)
FEATURE(always_add_domain)dnl
FEATURE(dnsbl,`blackholes.mail-abuse.org',` Mail from $&{client_addr} rejected, see http://mail-abuse.org/cgi-bin/lookup?$& {client_addr}')dnl
FEATURE(dnsbl,`relays.mail-abuse.org',` Mail from $&{client_addr} rejected; see http://mail-abuse.org/cgi-bin/nph-rss?$& {client_addr}')dnl
FEATURE(dnsbl,`dialups.mail-abuse.org',` Mail from dial-up rejected; see http://mail-abuse.org/dul/enduser.htm')
MAILER(local)dnl
MAILER(smtp)dnl
