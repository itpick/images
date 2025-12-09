{ pkgs, lib, ... }:

# TODO: Add tests for xeol-fips image
{
  name = "xeol-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for xeol-fips"
    exit 1
  '';
}
