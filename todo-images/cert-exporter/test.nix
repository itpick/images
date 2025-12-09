{ pkgs, lib, ... }:

# TODO: Add tests for cert-exporter image
{
  name = "cert-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-exporter"
    exit 1
  '';
}
