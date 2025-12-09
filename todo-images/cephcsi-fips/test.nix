{ pkgs, lib, ... }:

# TODO: Add tests for cephcsi-fips image
{
  name = "cephcsi-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cephcsi-fips"
    exit 1
  '';
}
