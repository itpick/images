{ pkgs, lib, ... }:

# TODO: Add tests for ratify-fips image
{
  name = "ratify-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ratify-fips"
    exit 1
  '';
}
