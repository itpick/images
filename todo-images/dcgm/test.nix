{ pkgs, lib, ... }:

# TODO: Add tests for dcgm image
{
  name = "dcgm";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dcgm"
    exit 1
  '';
}
