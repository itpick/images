{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-access-management-fips image
{
  name = "kubeflow-access-management-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-access-management-fips"
    exit 1
  '';
}
