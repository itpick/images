{ pkgs, lib, ... }:

# TODO: Add tests for jupyterhub-k8s-image-awaiter-fips image
{
  name = "jupyterhub-k8s-image-awaiter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jupyterhub-k8s-image-awaiter-fips"
    exit 1
  '';
}
