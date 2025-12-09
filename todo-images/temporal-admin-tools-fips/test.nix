{ pkgs, lib, ... }:

# TODO: Add tests for temporal-admin-tools-fips image
{
  name = "temporal-admin-tools-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for temporal-admin-tools-fips"
    exit 1
  '';
}
