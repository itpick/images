{ pkgs, lib, ... }:

# TODO: Add tests for nginx-otel-fips image
{
  name = "nginx-otel-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nginx-otel-fips"
    exit 1
  '';
}
