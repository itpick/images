{ pkgs, lib, ... }:

# TODO: Add tests for kserve-router image
{
  name = "kserve-router";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kserve-router"
    exit 1
  '';
}
