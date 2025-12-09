{ pkgs, lib, ... }:

# TODO: Add tests for ratify-crds image
{
  name = "ratify-crds";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ratify-crds"
    exit 1
  '';
}
