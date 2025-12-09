{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-admission-webhook-fips image
{
  name = "kubeflow-admission-webhook-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-admission-webhook-fips"
    exit 1
  '';
}
