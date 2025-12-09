{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-aws-controller-fips image
{
  name = "cluster-api-aws-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-aws-controller-fips"
    exit 1
  '';
}
