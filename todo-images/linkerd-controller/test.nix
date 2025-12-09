{ pkgs, lib, ... }:

# TODO: Add tests for linkerd-controller image
{
  name = "linkerd-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for linkerd-controller"
    exit 1
  '';
}
