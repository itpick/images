{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-gcp-dns image
{
  name = "crossplane-gcp-dns";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-gcp-dns"
    exit 1
  '';
}
