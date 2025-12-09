{ pkgs, lib, ... }:

# TODO: Add tests for k3s-static image
{
  name = "k3s-static";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k3s-static"
    exit 1
  '';
}
