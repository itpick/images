{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-podman-exporter-fips image
{
  name = "prometheus-podman-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-podman-exporter-fips"
    exit 1
  '';
}
