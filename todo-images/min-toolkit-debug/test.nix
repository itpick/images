{ pkgs, lib, ... }:

# TODO: Add tests for min-toolkit-debug image
{
  name = "min-toolkit-debug";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for min-toolkit-debug"
    exit 1
  '';
}
