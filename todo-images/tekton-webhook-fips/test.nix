{ pkgs, lib, ... }:

# TODO: Add tests for tekton-webhook-fips image
{
  name = "tekton-webhook-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-webhook-fips"
    exit 1
  '';
}
