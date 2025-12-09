{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-ipam-provider-in-cluster image
{
  name = "cluster-api-ipam-provider-in-cluster";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-ipam-provider-in-cluster"
    exit 1
  '';
}
