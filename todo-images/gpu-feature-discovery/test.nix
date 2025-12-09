{ pkgs, lib, ... }:

# TODO: Add tests for gpu-feature-discovery image
{
  name = "gpu-feature-discovery";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gpu-feature-discovery"
    exit 1
  '';
}
