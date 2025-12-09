{ pkgs, lib, ... }:

# TODO: Add tests for kapp-controller image
{
  name = "kapp-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kapp-controller"
    exit 1
  '';
}
