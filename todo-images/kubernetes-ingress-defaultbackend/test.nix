{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-ingress-defaultbackend image
{
  name = "kubernetes-ingress-defaultbackend";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-ingress-defaultbackend"
    exit 1
  '';
}
