#!/bin/bash

set -e

TULEAP_SOURCES="/tuleap"
RPM_BUILD="/rpms"

mkdir -p "$RPM_BUILD/"{BUILD,RPMS,SOURCES,SPECS,SRPMS}
cp "$TULEAP_SOURCES/"*tar.gz "$RPM_BUILD/SOURCES/"
OS='rhel6' make -C "$TULEAP_SOURCES/tools/rpm" rpm RPM_TMP="$RPM_BUILD"
