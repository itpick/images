{ pkgs, lib, ... }:

# TODO: Add tests for headlamp-fips image
{
  name = "headlamp-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for headlamp-fips"
    exit 1
  '';
}
