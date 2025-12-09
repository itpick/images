{ pkgs, lib, ... }:

# TODO: Add tests for linkerd-proxy-init image
{
  name = "linkerd-proxy-init";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for linkerd-proxy-init"
    exit 1
  '';
}
