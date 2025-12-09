{ pkgs, lib, ... }:

# TODO: Add tests for calico-calicoctl-fips image
{
  name = "calico-calicoctl-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-calicoctl-fips"
    exit 1
  '';
}
