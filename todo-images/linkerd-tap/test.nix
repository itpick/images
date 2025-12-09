{ pkgs, lib, ... }:

# TODO: Add tests for linkerd-tap image
{
  name = "linkerd-tap";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for linkerd-tap"
    exit 1
  '';
}
