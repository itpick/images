{ pkgs, lib, ... }:

# TODO: Add tests for nfs-subdir-external-provisioner image
{
  name = "nfs-subdir-external-provisioner";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nfs-subdir-external-provisioner"
    exit 1
  '';
}
