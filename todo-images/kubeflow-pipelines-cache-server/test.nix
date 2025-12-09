{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-pipelines-cache-server image
{
  name = "kubeflow-pipelines-cache-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-pipelines-cache-server"
    exit 1
  '';
}
