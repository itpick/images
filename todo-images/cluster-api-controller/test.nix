{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-controller image
{
  name = "cluster-api-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-controller"
    exit 1
  '';
}
