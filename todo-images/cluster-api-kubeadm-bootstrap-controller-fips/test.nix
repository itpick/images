{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-kubeadm-bootstrap-controller-fips image
{
  name = "cluster-api-kubeadm-bootstrap-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-kubeadm-bootstrap-controller-fips"
    exit 1
  '';
}
