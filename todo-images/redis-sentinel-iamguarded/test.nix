{ pkgs, lib, ... }:

# TODO: Add tests for redis-sentinel-iamguarded image
{
  name = "redis-sentinel-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for redis-sentinel-iamguarded"
    exit 1
  '';
}
