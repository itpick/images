{ pkgs, lib, ... }:

# TODO: Add tests for lvm-driver-fips image
{
  name = "lvm-driver-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for lvm-driver-fips"
    exit 1
  '';
}
