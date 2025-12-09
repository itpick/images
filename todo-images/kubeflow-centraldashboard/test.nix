{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-centraldashboard image
{
  name = "kubeflow-centraldashboard";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-centraldashboard"
    exit 1
  '';
}
