{ pkgs, lib, ... }:

# TODO: Add tests for amazon-k8s-cni-init-fips image
{
  name = "amazon-k8s-cni-init-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for amazon-k8s-cni-init-fips"
    exit 1
  '';
}
