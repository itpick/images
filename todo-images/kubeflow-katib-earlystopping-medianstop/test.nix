{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-katib-earlystopping-medianstop image
{
  name = "kubeflow-katib-earlystopping-medianstop";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-katib-earlystopping-medianstop"
    exit 1
  '';
}
