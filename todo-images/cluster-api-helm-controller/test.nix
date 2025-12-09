{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-helm-controller image
{
  name = "cluster-api-helm-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-helm-controller"
    exit 1
  '';
}
