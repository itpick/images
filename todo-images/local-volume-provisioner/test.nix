{ pkgs, lib, ... }:

# TODO: Add tests for local-volume-provisioner image
{
  name = "local-volume-provisioner";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for local-volume-provisioner"
    exit 1
  '';
}
