{ pkgs, lib, ... }:

# TODO: Add tests for ingress-nginx-custom-error-pages-iamguarded image
{
  name = "ingress-nginx-custom-error-pages-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ingress-nginx-custom-error-pages-iamguarded"
    exit 1
  '';
}
