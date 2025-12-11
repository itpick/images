{ pkgs, lib, ... }:

# TODO: Add tests for chisel image
{
  name = "chisel";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for chisel"
    exit 1
  '';
}
