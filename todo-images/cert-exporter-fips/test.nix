{ pkgs, lib, ... }:

# TODO: Add tests for cert-exporter-fips image
{
  name = "cert-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-exporter-fips"
    exit 1
  '';
}
