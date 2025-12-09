{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-azure-managedidentity image
{
  name = "crossplane-azure-managedidentity";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-azure-managedidentity"
    exit 1
  '';
}
