{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-pipelines-cache-deployer image
{
  name = "kubeflow-pipelines-cache-deployer";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-pipelines-cache-deployer"
    exit 1
  '';
}
