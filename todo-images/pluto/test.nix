{ pkgs, lib, ... }:

# TODO: Add tests for pluto image
{
  name = "pluto";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pluto"
    exit 1
  '';
}
