{ pkgs, lib, ... }:

# TODO: Add tests for ingress-nginx-controller-fips image
{
  name = "ingress-nginx-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ingress-nginx-controller-fips"
    exit 1
  '';
}
