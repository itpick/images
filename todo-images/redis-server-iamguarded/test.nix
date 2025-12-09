{ pkgs, lib, ... }:

# TODO: Add tests for redis-server-iamguarded image
{
  name = "redis-server-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for redis-server-iamguarded"
    exit 1
  '';
}
