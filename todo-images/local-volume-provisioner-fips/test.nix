{ pkgs, lib, ... }:

# TODO: Add tests for local-volume-provisioner-fips image
{
  name = "local-volume-provisioner-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for local-volume-provisioner-fips"
    exit 1
  '';
}
