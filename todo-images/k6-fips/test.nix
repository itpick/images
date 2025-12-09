{ pkgs, lib, ... }:

# TODO: Add tests for k6-fips image
{
  name = "k6-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k6-fips"
    exit 1
  '';
}
