{ pkgs, lib, ... }:

# TODO: Add tests for infinispan image
{
  name = "infinispan";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for infinispan"
    exit 1
  '';
}
