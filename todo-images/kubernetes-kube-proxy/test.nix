{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-kube-proxy image
{
  name = "kubernetes-kube-proxy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-kube-proxy"
    exit 1
  '';
}
