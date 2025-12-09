{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-gcp-kms image
{
  name = "crossplane-gcp-kms";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-gcp-kms"
    exit 1
  '';
}
