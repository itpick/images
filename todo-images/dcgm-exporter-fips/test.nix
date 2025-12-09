{ pkgs, lib, ... }:

# TODO: Add tests for dcgm-exporter-fips image
{
  name = "dcgm-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dcgm-exporter-fips"
    exit 1
  '';
}
