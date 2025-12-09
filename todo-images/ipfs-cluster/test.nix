{ pkgs, lib, ... }:

# TODO: Add tests for ipfs-cluster image
{
  name = "ipfs-cluster";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ipfs-cluster"
    exit 1
  '';
}
