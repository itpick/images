{ pkgs, lib, ... }:

# TODO: Add tests for redis-iamguarded image
{
  name = "redis-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for redis-iamguarded"
    exit 1
  '';
}
