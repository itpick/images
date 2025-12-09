{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-gcp-compute image
{
  name = "crossplane-gcp-compute";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-gcp-compute"
    exit 1
  '';
}
