{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-gcp-cloudplatform image
{
  name = "crossplane-gcp-cloudplatform";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-gcp-cloudplatform"
    exit 1
  '';
}
