{ pkgs, lib, ... }:

# TODO: Add tests for promxy-fips image
{
  name = "promxy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for promxy-fips"
    exit 1
  '';
}
