{ pkgs, lib, ... }:

# TODO: Add tests for tofu-controller image
{
  name = "tofu-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tofu-controller"
    exit 1
  '';
}
