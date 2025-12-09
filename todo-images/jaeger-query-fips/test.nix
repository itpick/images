{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-query-fips image
{
  name = "jaeger-query-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-query-fips"
    exit 1
  '';
}
