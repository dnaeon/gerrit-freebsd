Gerrit Port for FreeBSD
=======================

## Dependencies

* devel/git
* shells/bash
* USE\_PERL=	yes
* USE\_JAVA=	yes

## How to install the port

Update your Ports:
	
	# portsnap fetch update

Install the port:

	# cd /usr/ports/devel/gerrit && make install clean

## Installing from the Git repository

	# git clone git://github.com/dnaeon/gerrit-freebsd.git
	# cd gerrit-freebsd && make install clean

## Initializing Gerrit

When Gerrit is first started it will initialize itself and then start up the daemon.

## Accessing the Gerrit instance

Once Gerrit is started you can access it on port 8080, e.g.:

	http://example.org:8080/
