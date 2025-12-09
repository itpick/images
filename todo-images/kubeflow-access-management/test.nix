{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-access-management image
{
  name = "kubeflow-access-management";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-access-management"
    exit 1
  '';
}
