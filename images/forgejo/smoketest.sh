#!/bin/sh
# Regression check that the forgejo helm chart's init scripts can
# resolve their `#!/usr/bin/env bash` shebangs against this image.
# nix-store-only images don't ship anything at /usr/bin/env; without
# the envCompat symlink + /bin on PATH, the chart's init containers
# (init_directory_structure / config_environment / configure_gitea)
# fail before the main forgejo container can start.
set -eu
. /smoketest/helpers.sh

# /usr/bin/env resolves to a runnable binary
assert_path_exists /usr/bin/env executable

# /usr/bin/env can find bash on PATH (the chart's init shebang)
out=$(/usr/bin/env bash -c 'echo OK' 2>&1)
if [ "$out" != "OK" ]; then
  echo "ASSERT FAIL: /usr/bin/env bash didn't resolve (got: $out)"
  exit 1
fi

# the forgejo binary loads
assert_help_runs gitea --version

echo "ok"
