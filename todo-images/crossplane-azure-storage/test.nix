{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-azure-storage image
{
  name = "crossplane-azure-storage";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-azure-storage"
    exit 1
  '';
}
