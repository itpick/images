{ pkgs, lib, ... }:

# TODO: Add tests for az-iamguarded-fips image
{
  name = "az-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for az-iamguarded-fips"
    exit 1
  '';
}
