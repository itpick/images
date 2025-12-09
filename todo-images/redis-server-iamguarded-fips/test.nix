{ pkgs, lib, ... }:

# TODO: Add tests for redis-server-iamguarded-fips image
{
  name = "redis-server-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for redis-server-iamguarded-fips"
    exit 1
  '';
}
