{ pkgs, lib, ... }:

# TODO: Add tests for clamav-fips image
{
  name = "clamav-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for clamav-fips"
    exit 1
  '';
}
