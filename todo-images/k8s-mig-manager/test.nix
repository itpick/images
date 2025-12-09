{ pkgs, lib, ... }:

# TODO: Add tests for k8s-mig-manager image
{
  name = "k8s-mig-manager";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k8s-mig-manager"
    exit 1
  '';
}
