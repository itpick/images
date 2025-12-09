{ pkgs, lib, ... }:

# TODO: Add tests for redis-cluster-iamguarded-fips image
{
  name = "redis-cluster-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for redis-cluster-iamguarded-fips"
    exit 1
  '';
}
