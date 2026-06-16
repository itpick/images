#!/bin/sh
# Regression checks for pulumi-kubernetes-operator.
# Pre-PR-47-era this image was a STUB: hardcoded `version = "latest"`,
# bundled bash+coreutils with no operator binary at all. Bulk-swapping
# any cluster to it broke every Pulumi Stack CR because the chart's
# `command: ["/manager"]` failed with `exec: "/manager": no such file
# or directory`.
#
# Two asserts catch any future regression to that stub state:
set -eu
. /smoketest/helpers.sh

# 1) Chart hardcodes `/manager` -- top-level symlink must exist + be
#    executable (same pattern as keda /keda, cloudnative-pg /manager,
#    vmauth /vmauth-prod).
assert_chart_cmd_paths /manager

# 2) The binary is actually the pulumi-k8s-operator, not a placeholder
#    -- its --help output exposes the kubeconfig flag specific to the
#    operator's controller-runtime wiring.
out=$(/manager --help 2>&1 || true)
case "$out" in
  *kubeconfig*controller*|*"Usage of /manager"*)
    :
    ;;
  *)
    echo "ASSERT FAIL: /manager doesn't look like the operator binary"
    echo "$out" | head -5
    exit 1
    ;;
esac

echo "ok"
