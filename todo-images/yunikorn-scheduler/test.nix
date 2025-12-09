{ pkgs, lib, ... }:

# TODO: Add tests for yunikorn-scheduler image
{
  name = "yunikorn-scheduler";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for yunikorn-scheduler"
    exit 1
  '';
}
