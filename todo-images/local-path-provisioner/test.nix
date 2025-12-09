{ pkgs, lib, ... }:

# TODO: Add tests for local-path-provisioner image
{
  name = "local-path-provisioner";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for local-path-provisioner"
    exit 1
  '';
}
