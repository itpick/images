{ pkgs, lib, ... }:

# TODO: Add tests for pushprox-fips image
{
  name = "pushprox-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pushprox-fips"
    exit 1
  '';
}
