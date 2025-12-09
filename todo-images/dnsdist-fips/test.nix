{ pkgs, lib, ... }:

# TODO: Add tests for dnsdist-fips image
{
  name = "dnsdist-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dnsdist-fips"
    exit 1
  '';
}
