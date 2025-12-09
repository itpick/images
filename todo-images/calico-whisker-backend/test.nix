{ pkgs, lib, ... }:

# TODO: Add tests for calico-whisker-backend image
{
  name = "calico-whisker-backend";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-whisker-backend"
    exit 1
  '';
}
