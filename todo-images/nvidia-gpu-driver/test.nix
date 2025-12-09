{ pkgs, lib, ... }:

# TODO: Add tests for nvidia-gpu-driver image
{
  name = "nvidia-gpu-driver";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nvidia-gpu-driver"
    exit 1
  '';
}
