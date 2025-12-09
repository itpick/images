{ pkgs, lib, ... }:

# TODO: Add tests for spdx-tools image
{
  name = "spdx-tools";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spdx-tools"
    exit 1
  '';
}
