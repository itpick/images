{ pkgs, lib, ... }:

# TODO: Add tests for openresty-fips image
{
  name = "openresty-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for openresty-fips"
    exit 1
  '';
}
