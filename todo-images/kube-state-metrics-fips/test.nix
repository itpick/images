{ pkgs, lib, ... }:

# TODO: Add tests for kube-state-metrics-fips image
{
  name = "kube-state-metrics-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-state-metrics-fips"
    exit 1
  '';
}
