{ pkgs, lib, ... }:

# TODO: Add tests for dcgm-exporter image
{
  name = "dcgm-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dcgm-exporter"
    exit 1
  '';
}
