{ pkgs, lib, ... }:

# TODO: Add tests for knative-eventing-webhook-fips image
{
  name = "knative-eventing-webhook-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-eventing-webhook-fips"
    exit 1
  '';
}
