{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-volumes-web-app image
{
  name = "kubeflow-volumes-web-app";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-volumes-web-app"
    exit 1
  '';
}
