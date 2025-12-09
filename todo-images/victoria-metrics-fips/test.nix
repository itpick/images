{ pkgs, lib, ... }:

# TODO: Add tests for victoria-metrics-fips image
{
  name = "victoria-metrics-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for victoria-metrics-fips"
    exit 1
  '';
}
