{ pkgs, lib, ... }:

# TODO: Add tests for k8s-sidecar-fips image
{
  name = "k8s-sidecar-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k8s-sidecar-fips"
    exit 1
  '';
}
