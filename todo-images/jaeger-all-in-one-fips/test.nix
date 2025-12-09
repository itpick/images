{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-all-in-one-fips image
{
  name = "jaeger-all-in-one-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-all-in-one-fips"
    exit 1
  '';
}
