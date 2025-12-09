{ pkgs, lib, ... }:

# TODO: Add tests for knative-eventing-ingress-fips image
{
  name = "knative-eventing-ingress-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-eventing-ingress-fips"
    exit 1
  '';
}
