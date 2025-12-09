{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-adapter-fips image
{
  name = "prometheus-adapter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-adapter-fips"
    exit 1
  '';
}
