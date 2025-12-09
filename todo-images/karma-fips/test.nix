{ pkgs, lib, ... }:

# TODO: Add tests for karma-fips image
{
  name = "karma-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for karma-fips"
    exit 1
  '';
}
