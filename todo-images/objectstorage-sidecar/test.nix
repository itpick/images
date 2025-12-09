{ pkgs, lib, ... }:

# TODO: Add tests for objectstorage-sidecar image
{
  name = "objectstorage-sidecar";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for objectstorage-sidecar"
    exit 1
  '';
}
