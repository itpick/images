{ pkgs, lib, ... }:

# TODO: Add tests for rke2-runtime image
{
  name = "rke2-runtime";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rke2-runtime"
    exit 1
  '';
}
