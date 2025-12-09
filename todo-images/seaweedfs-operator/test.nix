{ pkgs, lib, ... }:

# TODO: Add tests for seaweedfs-operator image
{
  name = "seaweedfs-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for seaweedfs-operator"
    exit 1
  '';
}
