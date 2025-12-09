{ pkgs, lib, ... }:

# TODO: Add tests for memcached-iamguarded-fips image
{
  name = "memcached-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for memcached-iamguarded-fips"
    exit 1
  '';
}
