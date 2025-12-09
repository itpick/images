{ pkgs, lib, ... }:

# TODO: Add tests for authentik image
{
  name = "authentik";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for authentik"
    exit 1
  '';
}
