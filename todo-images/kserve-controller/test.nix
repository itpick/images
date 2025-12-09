{ pkgs, lib, ... }:

# TODO: Add tests for kserve-controller image
{
  name = "kserve-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kserve-controller"
    exit 1
  '';
}
