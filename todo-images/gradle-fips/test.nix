{ pkgs, lib, ... }:

# TODO: Add tests for gradle-fips image
{
  name = "gradle-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gradle-fips"
    exit 1
  '';
}
