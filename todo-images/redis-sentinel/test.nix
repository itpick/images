{ pkgs, lib, ... }:

# TODO: Add tests for redis-sentinel image
{
  name = "redis-sentinel";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for redis-sentinel"
    exit 1
  '';
}
