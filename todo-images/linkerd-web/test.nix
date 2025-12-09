{ pkgs, lib, ... }:

# TODO: Add tests for linkerd-web image
{
  name = "linkerd-web";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for linkerd-web"
    exit 1
  '';
}
