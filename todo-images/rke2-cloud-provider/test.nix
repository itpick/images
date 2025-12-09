{ pkgs, lib, ... }:

# TODO: Add tests for rke2-cloud-provider image
{
  name = "rke2-cloud-provider";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rke2-cloud-provider"
    exit 1
  '';
}
