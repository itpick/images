{ pkgs, lib, ... }:

# TODO: Add tests for dragonfly image
{
  name = "dragonfly";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dragonfly"
    exit 1
  '';
}
