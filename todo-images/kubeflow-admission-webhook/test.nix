{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-admission-webhook image
{
  name = "kubeflow-admission-webhook";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-admission-webhook"
    exit 1
  '';
}
