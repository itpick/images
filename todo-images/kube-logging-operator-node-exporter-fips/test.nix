{ pkgs, lib, ... }:

# TODO: Add tests for kube-logging-operator-node-exporter-fips image
{
  name = "kube-logging-operator-node-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-logging-operator-node-exporter-fips"
    exit 1
  '';
}
