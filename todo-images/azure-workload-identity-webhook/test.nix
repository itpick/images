{ pkgs, lib, ... }:

# TODO: Add tests for azure-workload-identity-webhook image
{
  name = "azure-workload-identity-webhook";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for azure-workload-identity-webhook"
    exit 1
  '';
}
