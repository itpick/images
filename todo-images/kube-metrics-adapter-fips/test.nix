{ pkgs, lib, ... }:

# TODO: Add tests for kube-metrics-adapter-fips image
{
  name = "kube-metrics-adapter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-metrics-adapter-fips"
    exit 1
  '';
}
