{ pkgs, lib, ... }:

# TODO: Add tests for configurable-http-proxy-fips image
{
  name = "configurable-http-proxy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for configurable-http-proxy-fips"
    exit 1
  '';
}
