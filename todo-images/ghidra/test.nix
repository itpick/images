{ pkgs, lib, ... }:

# TODO: Add tests for ghidra image
{
  name = "ghidra";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ghidra"
    exit 1
  '';
}
