{ pkgs, lib, ... }:

# TODO: Add tests for vela-core-fips image
{
  name = "vela-core-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vela-core-fips"
    exit 1
  '';
}
