{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-gcp-pubsub-fips image
{
  name = "crossplane-gcp-pubsub-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-gcp-pubsub-fips"
    exit 1
  '';
}
