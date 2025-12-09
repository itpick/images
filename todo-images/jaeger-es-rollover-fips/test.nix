{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-es-rollover-fips image
{
  name = "jaeger-es-rollover-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-es-rollover-fips"
    exit 1
  '';
}
