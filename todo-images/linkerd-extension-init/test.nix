{ pkgs, lib, ... }:

# TODO: Add tests for linkerd-extension-init image
{
  name = "linkerd-extension-init";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for linkerd-extension-init"
    exit 1
  '';
}
