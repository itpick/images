{ pkgs, lib, ... }:

# TODO: Add tests for knative-eventing-jobsink-fips image
{
  name = "knative-eventing-jobsink-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-eventing-jobsink-fips"
    exit 1
  '';
}
