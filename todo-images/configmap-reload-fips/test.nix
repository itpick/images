{ pkgs, lib, ... }:

# TODO: Add tests for configmap-reload-fips image
{
  name = "configmap-reload-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for configmap-reload-fips"
    exit 1
  '';
}
