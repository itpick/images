{ pkgs, lib, ... }:

# TODO: Add tests for stakater-reloader image
{
  name = "stakater-reloader";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for stakater-reloader"
    exit 1
  '';
}
