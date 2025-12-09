{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-clusterctl image
{
  name = "cluster-api-clusterctl";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-clusterctl"
    exit 1
  '';
}
