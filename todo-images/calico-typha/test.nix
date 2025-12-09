{ pkgs, lib, ... }:

# TODO: Add tests for calico-typha image
{
  name = "calico-typha";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-typha"
    exit 1
  '';
}
