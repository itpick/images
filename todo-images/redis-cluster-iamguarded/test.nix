{ pkgs, lib, ... }:

# TODO: Add tests for redis-cluster-iamguarded image
{
  name = "redis-cluster-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for redis-cluster-iamguarded"
    exit 1
  '';
}
