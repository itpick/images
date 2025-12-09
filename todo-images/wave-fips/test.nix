{ pkgs, lib, ... }:

# TODO: Add tests for wave-fips image
{
  name = "wave-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for wave-fips"
    exit 1
  '';
}
