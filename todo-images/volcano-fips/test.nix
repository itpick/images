{ pkgs, lib, ... }:

# TODO: Add tests for volcano-fips image
{
  name = "volcano-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for volcano-fips"
    exit 1
  '';
}
