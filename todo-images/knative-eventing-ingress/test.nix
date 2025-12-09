{ pkgs, lib, ... }:

# TODO: Add tests for knative-eventing-ingress image
{
  name = "knative-eventing-ingress";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-eventing-ingress"
    exit 1
  '';
}
