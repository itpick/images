{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-katib-suggestion-optuna image
{
  name = "kubeflow-katib-suggestion-optuna";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-katib-suggestion-optuna"
    exit 1
  '';
}
