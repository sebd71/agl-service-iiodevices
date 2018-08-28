#!/bin/sh

BINDER=$(command -v afb-daemon)
AFBTEST="$(pkg-config --variable libdir afb-test)/aft.so"
PROCNAME="aft-iiodevices"
PORT=1234
TOKEN=
LOGFILE="test.log"
[ "$1" ] && BUILDDIR="$1" || exit 1

TESTPACKAGEDIR="${BUILDDIR}/package-test"
export AFT_CONFIG_PATH="${TESTPACKAGEDIR}/etc"
export AFT_PLUGIN_PATH="${TESTPACKAGEDIR}/var:${TESTPACKAGEDIR}/lib/plugins"

pkill $PROCNAME

timeout -s 9 10	 "${BINDER}" 	--name="${PROCNAME}" \
				--port="${PORT}" \
				--roothttp=. \
				--tracereq=common \
				--token=${TOKEN} \
				--workdir="${TESTPACKAGEDIR}" \
				--binding="../package/lib/afb-iiodevices.so" \
				--binding="$AFBTEST" \
				--call="aft-iiodevices/launch_all_tests:{}" \
				--call="aft-iiodevices/exit:{}" \
				-vvv > "${LOGFILE}" 2>&1

find "${BUILDDIR}" -name test_results.log -exec cat {} \;
