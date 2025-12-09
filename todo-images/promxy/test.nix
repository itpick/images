{ pkgs, lib, ... }:

# TODO: Add tests for promxy image
{
  name = "promxy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for promxy"
    exit 1
  '';
}
