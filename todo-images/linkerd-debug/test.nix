{ pkgs, lib, ... }:

# TODO: Add tests for linkerd-debug image
{
  name = "linkerd-debug";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for linkerd-debug"
    exit 1
  '';
}
