{ pkgs, lib, ... }:

# TODO: Add tests for spiffe-helper-fips image
{
  name = "spiffe-helper-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spiffe-helper-fips"
    exit 1
  '';
}
