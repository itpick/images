{ pkgs, lib, ... }:

# TODO: Add tests for jellyfin image
{
  name = "jellyfin";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jellyfin"
    exit 1
  '';
}
