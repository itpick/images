{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-ingress-defaultbackend-fips image
{
  name = "kubernetes-ingress-defaultbackend-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-ingress-defaultbackend-fips"
    exit 1
  '';
}
