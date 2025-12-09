{ pkgs, lib, ... }:

# TODO: Add tests for min-toolkit-debug-fips image
{
  name = "min-toolkit-debug-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for min-toolkit-debug-fips"
    exit 1
  '';
}
