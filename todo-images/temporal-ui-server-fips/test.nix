{ pkgs, lib, ... }:

# TODO: Add tests for temporal-ui-server-fips image
{
  name = "temporal-ui-server-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for temporal-ui-server-fips"
    exit 1
  '';
}
