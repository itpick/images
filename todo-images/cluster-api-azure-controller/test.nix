{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-azure-controller image
{
  name = "cluster-api-azure-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-azure-controller"
    exit 1
  '';
}
