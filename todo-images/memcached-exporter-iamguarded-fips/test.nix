{ pkgs, lib, ... }:

# TODO: Add tests for memcached-exporter-iamguarded-fips image
{
  name = "memcached-exporter-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for memcached-exporter-iamguarded-fips"
    exit 1
  '';
}
