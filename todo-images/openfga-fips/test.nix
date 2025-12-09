{ pkgs, lib, ... }:

# TODO: Add tests for openfga-fips image
{
  name = "openfga-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for openfga-fips"
    exit 1
  '';
}
