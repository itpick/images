{ pkgs, lib, ... }:

# TODO: Add tests for azure-service-operator image
{
  name = "azure-service-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for azure-service-operator"
    exit 1
  '';
}
