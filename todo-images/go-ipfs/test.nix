{ pkgs, lib, ... }:

# TODO: Add tests for go-ipfs image
{
  name = "go-ipfs";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for go-ipfs"
    exit 1
  '';
}
