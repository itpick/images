{ pkgs, lib, ... }:

# TODO: Add tests for opa-fips image
{
  name = "opa-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opa-fips"
    exit 1
  '';
}
