{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-pause image
{
  name = "kubernetes-pause";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-pause"
    exit 1
  '';
}
