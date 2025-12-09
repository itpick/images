{ pkgs, lib, ... }:

# TODO: Add tests for cortex-fips image
{
  name = "cortex-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cortex-fips"
    exit 1
  '';
}
