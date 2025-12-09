{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-katib-file-metrics-collector image
{
  name = "kubeflow-katib-file-metrics-collector";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-katib-file-metrics-collector"
    exit 1
  '';
}
