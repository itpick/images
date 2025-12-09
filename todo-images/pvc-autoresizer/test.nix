{ pkgs, lib, ... }:

# TODO: Add tests for pvc-autoresizer image
{
  name = "pvc-autoresizer";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pvc-autoresizer"
    exit 1
  '';
}
