{ pkgs, lib, ... }:

# TODO: Add tests for knative-eventing-channel-controller-fips image
{
  name = "knative-eventing-channel-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-eventing-channel-controller-fips"
    exit 1
  '';
}
