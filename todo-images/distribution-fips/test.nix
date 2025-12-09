{ pkgs, lib, ... }:

# TODO: Add tests for distribution-fips image
{
  name = "distribution-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for distribution-fips"
    exit 1
  '';
}
