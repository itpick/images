{ pkgs, lib, ... }:

# TODO: Add tests for amazon-k8s-cni-fips image
{
  name = "amazon-k8s-cni-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for amazon-k8s-cni-fips"
    exit 1
  '';
}
