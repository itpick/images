{ pkgs, lib, ... }:

# TODO: Add tests for keda-metrics-apiserver-fips image
{
  name = "keda-metrics-apiserver-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for keda-metrics-apiserver-fips"
    exit 1
  '';
}
