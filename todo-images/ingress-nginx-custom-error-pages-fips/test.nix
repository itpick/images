{ pkgs, lib, ... }:

# TODO: Add tests for ingress-nginx-custom-error-pages-fips image
{
  name = "ingress-nginx-custom-error-pages-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ingress-nginx-custom-error-pages-fips"
    exit 1
  '';
}
