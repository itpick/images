{ pkgs, lib, ... }:

# TODO: Add tests for calico-whisker-fips image
{
  name = "calico-whisker-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-whisker-fips"
    exit 1
  '';
}
