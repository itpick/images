{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-gcp-pubsub image
{
  name = "crossplane-gcp-pubsub";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-gcp-pubsub"
    exit 1
  '';
}
