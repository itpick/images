{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-config-reloader-fips image
{
  name = "prometheus-config-reloader-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-config-reloader-fips"
    exit 1
  '';
}
