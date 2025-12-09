{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-pipelines-api-server image
{
  name = "kubeflow-pipelines-api-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-pipelines-api-server"
    exit 1
  '';
}
