{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-kube-apiserver-fips image
{
  name = "kubernetes-kube-apiserver-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-kube-apiserver-fips"
    exit 1
  '';
}
