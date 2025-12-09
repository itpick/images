{ pkgs, lib, ... }:

# TODO: Add tests for dex-k8s-authenticator image
{
  name = "dex-k8s-authenticator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dex-k8s-authenticator"
    exit 1
  '';
}
