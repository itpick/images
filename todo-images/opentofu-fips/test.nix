{ pkgs, lib, ... }:

# TODO: Add tests for opentofu-fips image
{
  name = "opentofu-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opentofu-fips"
    exit 1
  '';
}
