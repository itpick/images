{ pkgs, lib, ... }:

# TODO: Add tests for opentelemetry-collector-contrib-fips image
{
  name = "opentelemetry-collector-contrib-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opentelemetry-collector-contrib-fips"
    exit 1
  '';
}
