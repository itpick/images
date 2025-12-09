{ pkgs, lib, ... }:

# TODO: Add tests for squid-proxy-fips image
{
  name = "squid-proxy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for squid-proxy-fips"
    exit 1
  '';
}
