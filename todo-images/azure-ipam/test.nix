{ pkgs, lib, ... }:

# TODO: Add tests for azure-ipam image
{
  name = "azure-ipam";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for azure-ipam"
    exit 1
  '';
}
