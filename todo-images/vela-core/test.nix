{ pkgs, lib, ... }:

# TODO: Add tests for vela-core image
{
  name = "vela-core";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vela-core"
    exit 1
  '';
}
