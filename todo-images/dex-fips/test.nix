{ pkgs, lib, ... }:

# TODO: Add tests for dex-fips image
{
  name = "dex-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dex-fips"
    exit 1
  '';
}
