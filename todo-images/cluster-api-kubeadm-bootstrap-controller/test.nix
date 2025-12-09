{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-kubeadm-bootstrap-controller image
{
  name = "cluster-api-kubeadm-bootstrap-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-kubeadm-bootstrap-controller"
    exit 1
  '';
}
