{ pkgs, lib, ... }:

# TODO: Add tests for elasticsearch-fips image
{
  name = "elasticsearch-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for elasticsearch-fips"
    exit 1
  '';
}
