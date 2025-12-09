{ pkgs, lib, ... }:

# TODO: Add tests for wait-for-it-fips image
{
  name = "wait-for-it-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for wait-for-it-fips"
    exit 1
  '';
}
