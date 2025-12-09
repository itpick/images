{ pkgs, lib, ... }:

# TODO: Add tests for dynamic-localpv-provisioner image
{
  name = "dynamic-localpv-provisioner";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dynamic-localpv-provisioner"
    exit 1
  '';
}
