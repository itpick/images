{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-event-exporter image
{
  name = "kubernetes-event-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-event-exporter"
    exit 1
  '';
}
