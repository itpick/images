{ pkgs, lib, ... }:

# TODO: Add tests for knative-eventing-channel-dispatcher-fips image
{
  name = "knative-eventing-channel-dispatcher-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-eventing-channel-dispatcher-fips"
    exit 1
  '';
}
