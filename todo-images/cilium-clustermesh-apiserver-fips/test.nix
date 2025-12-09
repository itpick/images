{ pkgs, lib, ... }:

# TODO: Add tests for cilium-clustermesh-apiserver-fips image
{
  name = "cilium-clustermesh-apiserver-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cilium-clustermesh-apiserver-fips"
    exit 1
  '';
}
