{ pkgs, lib, ... }:

# TODO: Add tests for apm-server-fips image
{
  name = "apm-server-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for apm-server-fips"
    exit 1
  '';
}
