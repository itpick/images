{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-gcp-storage image
{
  name = "crossplane-gcp-storage";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-gcp-storage"
    exit 1
  '';
}
