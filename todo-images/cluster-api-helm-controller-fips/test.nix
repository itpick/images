{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-helm-controller-fips image
{
  name = "cluster-api-helm-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-helm-controller-fips"
    exit 1
  '';
}
