{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-katib-suggestion-skopt image
{
  name = "kubeflow-katib-suggestion-skopt";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-katib-suggestion-skopt"
    exit 1
  '';
}
