{ pkgs, lib, ... }:

# TODO: Add tests for calico-goldmane image
{
  name = "calico-goldmane";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-goldmane"
    exit 1
  '';
}
