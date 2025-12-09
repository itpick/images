{ pkgs, lib, ... }:

# TODO: Add tests for kube-rbac-proxy-fips image
{
  name = "kube-rbac-proxy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-rbac-proxy-fips"
    exit 1
  '';
}
