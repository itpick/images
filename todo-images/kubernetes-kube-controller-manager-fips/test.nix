{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-kube-controller-manager-fips image
{
  name = "kubernetes-kube-controller-manager-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-kube-controller-manager-fips"
    exit 1
  '';
}
