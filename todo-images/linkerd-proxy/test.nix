{ pkgs, lib, ... }:

# TODO: Add tests for linkerd-proxy image
{
  name = "linkerd-proxy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for linkerd-proxy"
    exit 1
  '';
}
