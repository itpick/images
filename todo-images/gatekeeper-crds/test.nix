{ pkgs, lib, ... }:

# TODO: Add tests for gatekeeper-crds image
{
  name = "gatekeeper-crds";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gatekeeper-crds"
    exit 1
  '';
}
