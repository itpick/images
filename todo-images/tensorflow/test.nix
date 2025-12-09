{ pkgs, lib, ... }:

# TODO: Add tests for tensorflow image
{
  name = "tensorflow";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tensorflow"
    exit 1
  '';
}
