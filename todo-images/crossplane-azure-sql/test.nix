{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-azure-sql image
{
  name = "crossplane-azure-sql";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-azure-sql"
    exit 1
  '';
}
