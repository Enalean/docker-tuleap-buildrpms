#!/bin/bash

set -e

TULEAP_SOURCES="/tuleap"
RPM_BUILD="/rpms"

options=`getopt -o h -l os: -- "$@"`

eval set -- "$options"
while true
do
    case "$1" in
    --os)
        os=$2;
        shift 2;;
    --)
        shift 1; break ;;
    *)
        break ;;
    esac
done

if [ -z "$os" ]; then
    echo "You must specify --os argument";
fi

mkdir -p "$RPM_BUILD/"{BUILD,RPMS,SOURCES,SPECS,SRPMS}
cp "$TULEAP_SOURCES/"*tar.gz "$RPM_BUILD/SOURCES/"
OS="$os" make -C "$TULEAP_SOURCES/tools/rpm" rpm RPM_TMP="$RPM_BUILD"
