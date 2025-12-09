{ pkgs, lib, ... }:

# TODO: Add tests for knative-eventing-mtchannel-broker-fips image
{
  name = "knative-eventing-mtchannel-broker-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-eventing-mtchannel-broker-fips"
    exit 1
  '';
}
