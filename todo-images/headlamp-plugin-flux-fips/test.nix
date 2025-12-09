{ pkgs, lib, ... }:

# TODO: Add tests for headlamp-plugin-flux-fips image
{
  name = "headlamp-plugin-flux-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for headlamp-plugin-flux-fips"
    exit 1
  '';
}
