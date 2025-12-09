{ pkgs, lib, ... }:

# TODO: Add tests for calico-whisker image
{
  name = "calico-whisker";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-whisker"
    exit 1
  '';
}
