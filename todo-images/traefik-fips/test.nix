{ pkgs, lib, ... }:

# TODO: Add tests for traefik-fips image
{
  name = "traefik-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for traefik-fips"
    exit 1
  '';
}
