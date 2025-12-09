{ pkgs, lib, ... }:

# TODO: Add tests for atlantis-fips image
{
  name = "atlantis-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for atlantis-fips"
    exit 1
  '';
}
