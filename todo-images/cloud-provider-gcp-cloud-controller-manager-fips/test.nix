{ pkgs, lib, ... }:

# TODO: Add tests for cloud-provider-gcp-cloud-controller-manager-fips image
{
  name = "cloud-provider-gcp-cloud-controller-manager-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cloud-provider-gcp-cloud-controller-manager-fips"
    exit 1
  '';
}
