{ pkgs, lib, ... }:

# TODO: Add tests for pdns-recursor-fips image
{
  name = "pdns-recursor-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pdns-recursor-fips"
    exit 1
  '';
}
