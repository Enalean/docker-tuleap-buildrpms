#!/bin/bash

BASE_PATH="/tuleap";
RPM_PATH="/srpms";
TMP_BUILD="/tmp/build";

options=`getopt -o h -l folder:,php: -- "$@"`

eval set -- "$options"
while true
do
    case "$1" in
    --folder)
        folder=$2;
        shift 2;;
    --php)
        php=$2;
        shift 2;;
    --)
        shift 1; break ;;
    *)
        break ;;
    esac
done

if [ -z "$folder" ] || [ -z "$php" ]; then
    echo "You must specify --folder and --php arguments";
fi

mkdir -p $TMP_BUILD $TMP_BUILD/BUILD $TMP_BUILD/RPMS $TMP_BUILD/SOURCES $TMP_BUILD/SPECS $TMP_BUILD/SRPMS $TMP_BUILD/TMP
find $RPM_PATH/$folder -name '*.src.rpm' | while read srpm
do
	pkgname=$(basename $srpm | sed 's/\(.[^0-9]*\)-.*/\1/')
	if ! ls $TMP_BUILD/RPMS/*/$pkgname-[0-9]*.rpm  2>/dev/null
	then
		echo "                |"
		echo "                ----- Building $pkgname -----"
		echo ""
		if [ -x /tuleap/${pkgname}.build.sh ] 
		then
			/tuleap/${pkgname}.build.sh $TMP_BUILD $srpm $php
		else
			/usr/bin/yum-builddep -y --nogpgcheck $srpm
			rpmbuild --define "_topdir $TMP_BUILD" --define "php_base $php" --rebuild $srpm
		fi
	else
		echo "                |"
		echo "                +-> $pkgname already built"
		echo ""
	fi
done
