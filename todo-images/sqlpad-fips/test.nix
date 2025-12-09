{ pkgs, lib, ... }:

# TODO: Add tests for sqlpad-fips image
{
  name = "sqlpad-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sqlpad-fips"
    exit 1
  '';
}
