{ pkgs, lib, ... }:

# TODO: Add tests for calico-pod2daemon-flexvol-fips image
{
  name = "calico-pod2daemon-flexvol-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-pod2daemon-flexvol-fips"
    exit 1
  '';
}
