{ pkgs, lib, ... }:

# TODO: Add tests for unbound-mailcow-fips image
{
  name = "unbound-mailcow-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for unbound-mailcow-fips"
    exit 1
  '';
}
