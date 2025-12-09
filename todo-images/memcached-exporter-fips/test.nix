{ pkgs, lib, ... }:

# TODO: Add tests for memcached-exporter-fips image
{
  name = "memcached-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for memcached-exporter-fips"
    exit 1
  '';
}
