{ pkgs, lib, ... }:

# TODO: Add tests for rke2-cloud-provider-fips image
{
  name = "rke2-cloud-provider-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rke2-cloud-provider-fips"
    exit 1
  '';
}
