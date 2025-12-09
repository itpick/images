{ pkgs, lib, ... }:

# TODO: Add tests for kayenta-fips image
{
  name = "kayenta-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kayenta-fips"
    exit 1
  '';
}
