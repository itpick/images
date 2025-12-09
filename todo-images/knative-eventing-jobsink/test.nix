{ pkgs, lib, ... }:

# TODO: Add tests for knative-eventing-jobsink image
{
  name = "knative-eventing-jobsink";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-eventing-jobsink"
    exit 1
  '';
}
