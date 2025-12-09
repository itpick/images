{ pkgs, lib, ... }:

# TODO: Add tests for volsync-fips image
{
  name = "volsync-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for volsync-fips"
    exit 1
  '';
}
