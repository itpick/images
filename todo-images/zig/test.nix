{ pkgs, lib, ... }:

# TODO: Add tests for zig image
{
  name = "zig";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for zig"
    exit 1
  '';
}
