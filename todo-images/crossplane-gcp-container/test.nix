{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-gcp-container image
{
  name = "crossplane-gcp-container";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-gcp-container"
    exit 1
  '';
}
