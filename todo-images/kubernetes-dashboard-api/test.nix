{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-dashboard-api image
{
  name = "kubernetes-dashboard-api";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-dashboard-api"
    exit 1
  '';
}
