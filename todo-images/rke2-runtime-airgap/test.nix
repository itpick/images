{ pkgs, lib, ... }:

# TODO: Add tests for rke2-runtime-airgap image
{
  name = "rke2-runtime-airgap";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rke2-runtime-airgap"
    exit 1
  '';
}
