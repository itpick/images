{ pkgs, lib, ... }:

# TODO: Add tests for nginx-iamguarded-fips image
{
  name = "nginx-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nginx-iamguarded-fips"
    exit 1
  '';
}
