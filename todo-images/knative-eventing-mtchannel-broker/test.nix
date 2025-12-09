{ pkgs, lib, ... }:

# TODO: Add tests for knative-eventing-mtchannel-broker image
{
  name = "knative-eventing-mtchannel-broker";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-eventing-mtchannel-broker"
    exit 1
  '';
}
