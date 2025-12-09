{ pkgs, lib, ... }:

# TODO: Add tests for ingress-nginx-controller-iamguarded-fips image
{
  name = "ingress-nginx-controller-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ingress-nginx-controller-iamguarded-fips"
    exit 1
  '';
}
