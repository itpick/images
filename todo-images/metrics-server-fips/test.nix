{ pkgs, lib, ... }:

# TODO: Add tests for metrics-server-fips image
{
  name = "metrics-server-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for metrics-server-fips"
    exit 1
  '';
}
