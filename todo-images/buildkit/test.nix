{ pkgs, lib, ... }:

# TODO: Add tests for buildkit image
{
  name = "buildkit";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for buildkit"
    exit 1
  '';
}
