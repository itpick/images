{ pkgs, lib, ... }:

# TODO: Add tests for omni-fips image
{
  name = "omni-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for omni-fips"
    exit 1
  '';
}
