{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-podman-exporter image
{
  name = "prometheus-podman-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-podman-exporter"
    exit 1
  '';
}
