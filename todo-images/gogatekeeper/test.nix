{ pkgs, lib, ... }:

# TODO: Add tests for gogatekeeper image
{
  name = "gogatekeeper";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gogatekeeper"
    exit 1
  '';
}
