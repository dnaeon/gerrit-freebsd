Gerrit Port for FreeBSD
=======================

## How to install the port

Update your Ports:
	
	# portsnap fetch update

Install the port:

	# cd /usr/ports/devel/gerrit && make install clean

## Installing from the Git repository

	# git clone git://github.com/dnaeon/gerrit-freebsd.git
	# cd gerrit-freebsd && make install clean
