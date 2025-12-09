{ pkgs, lib, ... }:

# TODO: Add tests for kong-fips image
{
  name = "kong-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kong-fips"
    exit 1
  '';
}
