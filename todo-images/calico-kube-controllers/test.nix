{ pkgs, lib, ... }:

# TODO: Add tests for calico-kube-controllers image
{
  name = "calico-kube-controllers";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-kube-controllers"
    exit 1
  '';
}
