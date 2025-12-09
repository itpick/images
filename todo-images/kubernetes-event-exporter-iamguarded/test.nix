{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-event-exporter-iamguarded image
{
  name = "kubernetes-event-exporter-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-event-exporter-iamguarded"
    exit 1
  '';
}
