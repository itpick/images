{ pkgs, lib, ... }:

# TODO: Add tests for polaris-fips image
{
  name = "polaris-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for polaris-fips"
    exit 1
  '';
}
