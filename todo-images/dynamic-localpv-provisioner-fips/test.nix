{ pkgs, lib, ... }:

# TODO: Add tests for dynamic-localpv-provisioner-fips image
{
  name = "dynamic-localpv-provisioner-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dynamic-localpv-provisioner-fips"
    exit 1
  '';
}
