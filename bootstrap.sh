#!/bin/sh
# $Id$

# This file is part of ifplugd.
#
# ifplugd is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# ifplugd is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with ifplugd; if not, write to the Free Software Foundation,
# Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.

if [ "x$1" = "xam" ] ; then
    set -ex
    automake -a -c
    ./config.status
else 
    set -ex

    rm -rf autom4te.cache
    rm -f config.cache

    aclocal
    autoheader
    automake -a -c
    autoconf -Wall

    ./configure --sysconfdir=/etc "$@"
fi
