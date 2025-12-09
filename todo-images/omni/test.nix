{ pkgs, lib, ... }:

# TODO: Add tests for omni image
{
  name = "omni";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for omni"
    exit 1
  '';
}
