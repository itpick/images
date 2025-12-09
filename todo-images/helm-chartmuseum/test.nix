{ pkgs, lib, ... }:

# TODO: Add tests for helm-chartmuseum image
{
  name = "helm-chartmuseum";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for helm-chartmuseum"
    exit 1
  '';
}
