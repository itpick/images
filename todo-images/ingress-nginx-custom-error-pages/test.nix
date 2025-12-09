{ pkgs, lib, ... }:

# TODO: Add tests for ingress-nginx-custom-error-pages image
{
  name = "ingress-nginx-custom-error-pages";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ingress-nginx-custom-error-pages"
    exit 1
  '';
}
