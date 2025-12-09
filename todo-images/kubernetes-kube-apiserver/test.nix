{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-kube-apiserver image
{
  name = "kubernetes-kube-apiserver";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-kube-apiserver"
    exit 1
  '';
}
