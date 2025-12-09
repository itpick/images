{ pkgs, lib, ... }:

# TODO: Add tests for strongswan image
{
  name = "strongswan";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for strongswan"
    exit 1
  '';
}
