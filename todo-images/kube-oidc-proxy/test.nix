{ pkgs, lib, ... }:

# TODO: Add tests for kube-oidc-proxy image
{
  name = "kube-oidc-proxy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-oidc-proxy"
    exit 1
  '';
}
