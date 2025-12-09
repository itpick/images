{ pkgs, lib, ... }:

# TODO: Add tests for k3s image
{
  name = "k3s";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k3s"
    exit 1
  '';
}
