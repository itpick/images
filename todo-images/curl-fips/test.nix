{ pkgs, lib, ... }:

# TODO: Add tests for curl-fips image
{
  name = "curl-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for curl-fips"
    exit 1
  '';
}
