{ pkgs, lib, ... }:

# TODO: Add tests for kube-downscaler image
{
  name = "kube-downscaler";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-downscaler"
    exit 1
  '';
}
