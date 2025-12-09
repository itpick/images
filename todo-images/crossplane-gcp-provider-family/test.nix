{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-gcp-provider-family image
{
  name = "crossplane-gcp-provider-family";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-gcp-provider-family"
    exit 1
  '';
}
