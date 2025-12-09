{ pkgs, lib, ... }:

# TODO: Add tests for temporal-server-fips image
{
  name = "temporal-server-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for temporal-server-fips"
    exit 1
  '';
}
