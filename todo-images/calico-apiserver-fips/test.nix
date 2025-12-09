{ pkgs, lib, ... }:

# TODO: Add tests for calico-apiserver-fips image
{
  name = "calico-apiserver-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-apiserver-fips"
    exit 1
  '';
}
