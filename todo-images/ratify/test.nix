{ pkgs, lib, ... }:

# TODO: Add tests for ratify image
{
  name = "ratify";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ratify"
    exit 1
  '';
}
