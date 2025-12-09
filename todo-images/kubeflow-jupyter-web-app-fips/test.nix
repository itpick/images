{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-jupyter-web-app-fips image
{
  name = "kubeflow-jupyter-web-app-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-jupyter-web-app-fips"
    exit 1
  '';
}
