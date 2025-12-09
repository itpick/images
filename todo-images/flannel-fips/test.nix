{ pkgs, lib, ... }:

# TODO: Add tests for flannel-fips image
{
  name = "flannel-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flannel-fips"
    exit 1
  '';
}
