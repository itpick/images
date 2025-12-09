{ pkgs, lib, ... }:

# TODO: Add tests for memcached-exporter-iamguarded image
{
  name = "memcached-exporter-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for memcached-exporter-iamguarded"
    exit 1
  '';
}
