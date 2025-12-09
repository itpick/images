{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-capd-manager image
{
  name = "cluster-api-capd-manager";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-capd-manager"
    exit 1
  '';
}
