{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-azure image
{
  name = "crossplane-azure";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-azure"
    exit 1
  '';
}
