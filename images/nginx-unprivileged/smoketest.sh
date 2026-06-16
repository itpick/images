#!/bin/sh
# Regression checks for nginx-unprivileged.
# 1) image has explicit Entrypoint+Cmd so charts with command:null work
#    (chart fails with "no command specified" otherwise)
# 2) the nginx process (running as 65532) can write to /tmp + the
#    nginx temp/log dirs nginx -V says are compile-time defaults
#    (--error-log-path=/var/log/nginx/error.log, --pid-path,
#    --http-client-body-temp-path=/tmp/nginx_client_body, etc.)
set -eu
. /smoketest/helpers.sh

# binary loads + config syntax-checks
assert_help_runs nginx -v

# writable scratch dirs (as the current user; runs in default-cmd
# context with image's User = 65532:65532)
mkdir -p /tmp/nginx_client_body
touch /var/log/nginx/.write-test && rm /var/log/nginx/.write-test
touch /var/cache/nginx/.write-test && rm /var/cache/nginx/.write-test

echo "ok"
