{ pkgs, lib, ... }:

# TODO: Add tests for nfs-subdir-external-provisioner-fips image
{
  name = "nfs-subdir-external-provisioner-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nfs-subdir-external-provisioner-fips"
    exit 1
  '';
}
