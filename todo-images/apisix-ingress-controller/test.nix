{ pkgs, lib, ... }:

# TODO: Add tests for apisix-ingress-controller image
{
  name = "apisix-ingress-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for apisix-ingress-controller"
    exit 1
  '';
}
