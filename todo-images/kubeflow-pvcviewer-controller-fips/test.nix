{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-pvcviewer-controller-fips image
{
  name = "kubeflow-pvcviewer-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-pvcviewer-controller-fips"
    exit 1
  '';
}
