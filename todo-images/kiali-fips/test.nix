{ pkgs, lib, ... }:

# TODO: Add tests for kiali-fips image
{
  name = "kiali-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kiali-fips"
    exit 1
  '';
}
