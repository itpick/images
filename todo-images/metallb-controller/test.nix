{ pkgs, lib, ... }:

# TODO: Add tests for metallb-controller image
{
  name = "metallb-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for metallb-controller"
    exit 1
  '';
}
