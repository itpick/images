{ pkgs, lib, ... }:

# TODO: Add tests for neuvector-updater-fips image
{
  name = "neuvector-updater-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for neuvector-updater-fips"
    exit 1
  '';
}
