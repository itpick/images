{ pkgs, lib, ... }:

# TODO: Add tests for nginx-fips image
{
  name = "nginx-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nginx-fips"
    exit 1
  '';
}
