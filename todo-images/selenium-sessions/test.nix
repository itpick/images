{ pkgs, lib, ... }:

# TODO: Add tests for selenium-sessions image
{
  name = "selenium-sessions";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for selenium-sessions"
    exit 1
  '';
}
