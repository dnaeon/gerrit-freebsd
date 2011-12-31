# New ports collection makefile for:	gerrit
# Date created:		2011-12-27
# Whom:			Marin Atanasov Nikolov <dnaeon@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	gerrit
PORTVERSION=	2.2.2rc0
CATEGORIES=	devel java
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE}
EXTRACT_SUFX=	.war
DIST_SUBDIR=	${PORTNAME}/${PORTVERSION}
DISTNAME=	${PORTNAME}-2.2.2-rc0
EXTRACT_ONLY=

MAINTAINER=	dnaeon@gmail.com
COMMENT=	Web based code review and project management for Git based projects.

RUN_DEPENDS+=	bash:${PORTSDIR}/shells/bash \
		git:${PORTSDIR}/devel/git

USE_JAVA=	yes
JAVA_VERSION=	1.5+

USE_PERL5=	yes

FETCH_ARGS=	-Fpr
NO_BUILD=	yes

USE_RC_SUBR=	gerrit

GERRIT_HOME?=	${PREFIX}/gerrit
GERRIT_USER?=	gerrit
GERRIT_GROUP?=	gerrit
GERRIT_SITE?=	review_site

.if ${GERRIT_USER} == "gerrit"
USERS=	${GERRIT_USER}
.endif
.if ${GERRIT_GROUP} == "gerrit"
GROUPS=	${GERRIT_GROUP}
.endif

PLIST_FILES=	%%DATADIR%%/${PORTNAME}${EXTRACT_SUFX}
PLIST_DIRS=	%%DATADIR%%
PLIST_DIRSTRY=	gerrit
SUB_LIST+=	GERRIT_HOME=${GERRIT_HOME} GERRIT_USER=${GERRIT_USER} GERRIT_GROUP=${GERRIT_GROUP} GERRIT_SITE=${GERRIT_SITE} JAVA_HOME=${JAVA_HOME}

.include <bsd.port.pre.mk>

do-install:
	${MKDIR} "${DATADIR}"
	${INSTALL_DATA} ${DISTDIR}/${DIST_SUBDIR}/${DISTNAME}${EXTRACT_SUFX} ${DATADIR}/${PORTNAME}${EXTRACT_SUFX}

post-install:
	@${ECHO_CMD}
	@${CAT} ${PKGMESSAGE}
	@${ECHO_CMD}

.include <bsd.port.post.mk>
