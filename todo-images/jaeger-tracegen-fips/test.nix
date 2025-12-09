{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-tracegen-fips image
{
  name = "jaeger-tracegen-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-tracegen-fips"
    exit 1
  '';
}
