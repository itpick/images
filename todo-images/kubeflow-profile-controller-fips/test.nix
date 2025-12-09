{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-profile-controller-fips image
{
  name = "kubeflow-profile-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-profile-controller-fips"
    exit 1
  '';
}
