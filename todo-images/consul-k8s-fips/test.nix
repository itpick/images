{ pkgs, lib, ... }:

# TODO: Add tests for consul-k8s-fips image
{
  name = "consul-k8s-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for consul-k8s-fips"
    exit 1
  '';
}
