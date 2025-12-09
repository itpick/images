{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-dashboard-web image
{
  name = "kubernetes-dashboard-web";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-dashboard-web"
    exit 1
  '';
}
