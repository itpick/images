{ pkgs, lib, ... }:

# TODO: Add tests for opentelemetry-collector-fips image
{
  name = "opentelemetry-collector-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opentelemetry-collector-fips"
    exit 1
  '';
}
