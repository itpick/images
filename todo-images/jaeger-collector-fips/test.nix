{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-collector-fips image
{
  name = "jaeger-collector-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-collector-fips"
    exit 1
  '';
}
