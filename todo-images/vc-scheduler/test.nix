{ pkgs, lib, ... }:

# TODO: Add tests for vc-scheduler image
{
  name = "vc-scheduler";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vc-scheduler"
    exit 1
  '';
}
