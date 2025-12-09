{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-kube-proxy-fips image
{
  name = "kubernetes-kube-proxy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-kube-proxy-fips"
    exit 1
  '';
}
