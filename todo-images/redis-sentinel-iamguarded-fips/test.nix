{ pkgs, lib, ... }:

# TODO: Add tests for redis-sentinel-iamguarded-fips image
{
  name = "redis-sentinel-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for redis-sentinel-iamguarded-fips"
    exit 1
  '';
}
