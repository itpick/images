{ pkgs, lib, ... }:

# TODO: Add tests for grpc-health-probe-fips image
{
  name = "grpc-health-probe-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grpc-health-probe-fips"
    exit 1
  '';
}
