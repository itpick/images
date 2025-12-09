{ pkgs, lib, ... }:

# TODO: Add tests for x509-certificate-exporter image
{
  name = "x509-certificate-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for x509-certificate-exporter"
    exit 1
  '';
}
