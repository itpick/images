{ pkgs, lib, ... }:

# TODO: Add tests for kubeflow-volumes-web-app-fips image
{
  name = "kubeflow-volumes-web-app-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubeflow-volumes-web-app-fips"
    exit 1
  '';
}
