#!/usr/bin/env bash
# Smoketest for kubectl-dev — runs in-pod against the freshly built image
# via the kind workflow. Each line is a load-bearing assertion about
# either a binary's presence on PATH or its semantic behavior.
#
# Convention: any image directory that ships a `smoketest.sh` gets this
# script used as the kind Pod's command. Exit 0 = pass, non-zero = fail.
#
# What this catches that the default smoke can't:
#   - Wrong yq variant (Python jq-wrapper vs Go mikefarah). The original
#     kubectl-dev shadow bug ended up with Python yq in the closure, which
#     made `yq -o=json` fail with `jq: Unknown option -o`. The explicit
#     `mikefarah` grep below would've blocked the publish.
#   - Binary not on PATH (regression: prod's cnpg-stg-restore-smoketest
#     job hit `kubectl: command not found` because the image's Env didn't
#     declare PATH and the shadow base lacked /bin/kubectl). Bare-name
#     invocation here would've caught it.
set -euo pipefail

echo "--- PATH check ---"
echo "PATH=$PATH"

echo "--- Kubernetes toolchain ---"
kubectl version --client
kustomize version
helm version --short

echo "--- JSON / YAML ---"
jq --version
# Must be Go yq (mikefarah), not the Python jq-wrapper. No temp file —
# the image's /tmp may not be writable for the non-root user.
yq --version
yq --version | grep -q 'mikefarah'
# `-o=json` is Go-yq syntax; Python yq would forward to jq and explode.
echo 'a: 1' | yq -o=json . | grep -q '"a": 1'

echo "--- Secrets handling ---"
sops --version
age --version

echo "--- Network / debug ---"
curl --version >/dev/null
wget --version >/dev/null
dig -v
openssl version

echo "--- Shell / coreutils ---"
bash --version >/dev/null
sed --version >/dev/null
grep --version >/dev/null
tar --version >/dev/null

echo "All bundled binaries OK"
