{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-katib-suggestion-pbt image
{
  name = "kubeflow-katib-suggestion-pbt";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-katib-suggestion-pbt"
    exit 1
  '';
}
