{ pkgs, lib, ... }:

# TODO: Add tests for gotenberg image
{
  name = "gotenberg";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gotenberg"
    exit 1
  '';
}
