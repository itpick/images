{ pkgs, lib, ... }:

# TODO: Add tests for kserve-storage-initializer image
{
  name = "kserve-storage-initializer";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kserve-storage-initializer"
    exit 1
  '';
}
