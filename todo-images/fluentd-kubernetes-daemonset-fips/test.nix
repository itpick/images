{ pkgs, lib, ... }:

# TODO: Add tests for fluentd-kubernetes-daemonset-fips image
{
  name = "fluentd-kubernetes-daemonset-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for fluentd-kubernetes-daemonset-fips"
    exit 1
  '';
}
