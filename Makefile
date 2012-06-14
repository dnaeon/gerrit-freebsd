# New ports collection makefile for:	gerrit
# Date created:		2011-12-27
# Whom:			Marin Atanasov Nikolov <dnaeon@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	gerrit
PORTVERSION=	2.4.1
CATEGORIES=	devel java
MASTER_SITES=	GOOGLE_CODE
DISTNAME=	${PORTNAME}-${PORTVERSION}
EXTRACT_SUFX=	.war
EXTRACT_ONLY=	#empty

MAINTAINER=	dnaeon@gmail.com
COMMENT=	Web based code review and project management for Git based projects

RUN_DEPENDS+=	bash:${PORTSDIR}/shells/bash \
		git:${PORTSDIR}/devel/git

USE_JAVA=	yes
JAVA_VERSION=	1.5+

USE_PERL5=	yes

FETCH_ARGS=	-Fpr
MANUAL_PACKAGE_BUILD=	installs unknown amount of files to ${GERRIT_HOME}
NO_BUILD=	yes

USE_RC_SUBR=	gerrit

GERRIT_HOME=	${PREFIX}/gerrit
USERS=	gerrit
GROUPS=	gerrit
GERRIT_SITE?=	review_site

PLIST_FILES=	%%DATADIR%%/${PORTNAME}${EXTRACT_SUFX}
PLIST_DIRS=	%%DATADIR%%
PLIST_DIRSTRY=	gerrit
SUB_LIST+=	GERRIT_HOME=${GERRIT_HOME} \
		GERRIT_SITE=${GERRIT_SITE} \
		GROUPS=${GROUPS} \
		JAVA_HOME=${JAVA_HOME} \
		USERS=${USERS}

do-install:
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} ${DATADIR}/${PORTNAME}${EXTRACT_SUFX}

post-install:
	@${ECHO_CMD}
	@${CAT} ${PKGMESSAGE}
	@${ECHO_CMD}

.include <bsd.port.mk>
