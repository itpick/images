{ pkgs, lib, ... }:

# TODO: Add tests for spiffe-helper image
{
  name = "spiffe-helper";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spiffe-helper"
    exit 1
  '';
}
