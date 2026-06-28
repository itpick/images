#!/bin/sh
# Smoketest for python — runs in-pod via the kind workflow.
#
# The default (no-arg) image drops into a Python REPL, which exits
# immediately on a TTY-less pod, so the 0-config kind smoke can't
# classify it (CLI-needs-subcommand category in KNOWN-LIMITATIONS.md).
# This asserts the interpreter loads, and — more usefully — that the
# stdlib C-extension modules whose presence depends on the image's
# native-lib closure (libssl3, sqlite-libs, zlib, xz/lzma, libbz2)
# actually import. That is the exact "C lib dropped from the closure"
# regression the helpers library was built to catch cheaply.
set -eu
. /smoketest/helpers.sh

assert_help_runs python3 --version
assert_help_runs python3 -c 'print("ok")'
# C-extension stdlib modules gated on the native-lib closure being complete.
assert_python_imports ssl sqlite3 zlib lzma bz2 ctypes hashlib decimal readline
# bundled package manager loads
assert_help_runs pip --version

echo "ok"
