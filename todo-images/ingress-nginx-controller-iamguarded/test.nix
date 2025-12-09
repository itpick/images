{ pkgs, lib, ... }:

# TODO: Add tests for ingress-nginx-controller-iamguarded image
{
  name = "ingress-nginx-controller-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ingress-nginx-controller-iamguarded"
    exit 1
  '';
}
