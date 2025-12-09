{ pkgs, lib, ... }:

# TODO: Add tests for grype-fips image
{
  name = "grype-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grype-fips"
    exit 1
  '';
}
