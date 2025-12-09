{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-pipelines-metadata-envoy image
{
  name = "kubeflow-pipelines-metadata-envoy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-pipelines-metadata-envoy"
    exit 1
  '';
}
