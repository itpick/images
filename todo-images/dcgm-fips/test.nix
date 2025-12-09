{ pkgs, lib, ... }:

# TODO: Add tests for dcgm-fips image
{
  name = "dcgm-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dcgm-fips"
    exit 1
  '';
}
