{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-katib-suggestion-hyperopt image
{
  name = "kubeflow-katib-suggestion-hyperopt";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-katib-suggestion-hyperopt"
    exit 1
  '';
}
