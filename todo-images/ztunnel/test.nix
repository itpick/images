{ pkgs, lib, ... }:

# TODO: Add tests for ztunnel image
{
  name = "ztunnel";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ztunnel"
    exit 1
  '';
}
