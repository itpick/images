{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-ingester-fips image
{
  name = "jaeger-ingester-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-ingester-fips"
    exit 1
  '';
}
