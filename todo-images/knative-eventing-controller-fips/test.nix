{ pkgs, lib, ... }:

# TODO: Add tests for knative-eventing-controller-fips image
{
  name = "knative-eventing-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-eventing-controller-fips"
    exit 1
  '';
}
