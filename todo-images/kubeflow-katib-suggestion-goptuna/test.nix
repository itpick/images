{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-katib-suggestion-goptuna image
{
  name = "kubeflow-katib-suggestion-goptuna";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-katib-suggestion-goptuna"
    exit 1
  '';
}
