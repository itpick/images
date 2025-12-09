{ pkgs, lib, ... }:

# TODO: Add tests for ingress-nginx-controller image
{
  name = "ingress-nginx-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ingress-nginx-controller"
    exit 1
  '';
}
