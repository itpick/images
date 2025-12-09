{ pkgs, lib, ... }:

# TODO: Add tests for redis-iamguarded-fips image
{
  name = "redis-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for redis-iamguarded-fips"
    exit 1
  '';
}
