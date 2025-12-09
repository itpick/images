{ pkgs, lib, ... }:

# TODO: Add tests for memcached-fips image
{
  name = "memcached-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for memcached-fips"
    exit 1
  '';
}
