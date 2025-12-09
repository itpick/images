{ pkgs, lib, ... }:

# TODO: Add tests for opentelemetry-operator-target-allocator-fips image
{
  name = "opentelemetry-operator-target-allocator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opentelemetry-operator-target-allocator-fips"
    exit 1
  '';
}
