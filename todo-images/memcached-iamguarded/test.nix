{ pkgs, lib, ... }:

# TODO: Add tests for memcached-iamguarded image
{
  name = "memcached-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for memcached-iamguarded"
    exit 1
  '';
}
