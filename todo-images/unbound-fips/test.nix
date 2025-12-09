{ pkgs, lib, ... }:

# TODO: Add tests for unbound-fips image
{
  name = "unbound-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for unbound-fips"
    exit 1
  '';
}
