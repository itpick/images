{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-gcp-controller-fips image
{
  name = "cluster-api-gcp-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-gcp-controller-fips"
    exit 1
  '';
}
