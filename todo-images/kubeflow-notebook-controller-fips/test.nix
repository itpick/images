{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-notebook-controller-fips image
{
  name = "kubeflow-notebook-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-notebook-controller-fips"
    exit 1
  '';
}
