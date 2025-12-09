{ pkgs, lib, ... }:

# TODO: Add tests for oauth2-proxy-fips image
{
  name = "oauth2-proxy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for oauth2-proxy-fips"
    exit 1
  '';
}
