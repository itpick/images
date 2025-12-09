{ pkgs, lib, ... }:

# TODO: Add tests for opentelemetry-operator-fips image
{
  name = "opentelemetry-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opentelemetry-operator-fips"
    exit 1
  '';
}
