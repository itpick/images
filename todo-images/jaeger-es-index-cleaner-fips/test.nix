{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-es-index-cleaner-fips image
{
  name = "jaeger-es-index-cleaner-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-es-index-cleaner-fips"
    exit 1
  '';
}
