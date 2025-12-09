{ pkgs, lib, ... }:

# TODO: Add tests for knative-eventing-channel-dispatcher image
{
  name = "knative-eventing-channel-dispatcher";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-eventing-channel-dispatcher"
    exit 1
  '';
}
