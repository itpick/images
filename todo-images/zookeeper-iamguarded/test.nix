{ pkgs, lib, ... }:

# TODO: Add tests for zookeeper-iamguarded image
{
  name = "zookeeper-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for zookeeper-iamguarded"
    exit 1
  '';
}
