{ pkgs, lib, ... }:

# TODO: Add tests for selenium-session-queue image
{
  name = "selenium-session-queue";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for selenium-session-queue"
    exit 1
  '';
}
