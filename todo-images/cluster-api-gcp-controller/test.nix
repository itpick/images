{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-gcp-controller image
{
  name = "cluster-api-gcp-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-gcp-controller"
    exit 1
  '';
}
