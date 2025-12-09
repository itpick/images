{ pkgs, lib, ... }:

# TODO: Add tests for local-path-provisioner-fips image
{
  name = "local-path-provisioner-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for local-path-provisioner-fips"
    exit 1
  '';
}
