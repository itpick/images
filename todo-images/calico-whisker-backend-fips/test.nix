{ pkgs, lib, ... }:

# TODO: Add tests for calico-whisker-backend-fips image
{
  name = "calico-whisker-backend-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-whisker-backend-fips"
    exit 1
  '';
}
