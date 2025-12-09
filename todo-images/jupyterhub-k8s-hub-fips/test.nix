{ pkgs, lib, ... }:

# TODO: Add tests for jupyterhub-k8s-hub-fips image
{
  name = "jupyterhub-k8s-hub-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jupyterhub-k8s-hub-fips"
    exit 1
  '';
}
