{ pkgs, lib, ... }:

# TODO: Add tests for objectstorage-controller image
{
  name = "objectstorage-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for objectstorage-controller"
    exit 1
  '';
}
