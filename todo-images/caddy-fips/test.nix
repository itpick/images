{ pkgs, lib, ... }:

# TODO: Add tests for caddy-fips image
{
  name = "caddy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for caddy-fips"
    exit 1
  '';
}
