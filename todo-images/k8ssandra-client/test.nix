{ pkgs, lib, ... }:

# TODO: Add tests for k8ssandra-client image
{
  name = "k8ssandra-client";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k8ssandra-client"
    exit 1
  '';
}
