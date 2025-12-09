{ pkgs, lib, ... }:

# TODO: Add tests for x509-certificate-exporter-fips image
{
  name = "x509-certificate-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for x509-certificate-exporter-fips"
    exit 1
  '';
}
