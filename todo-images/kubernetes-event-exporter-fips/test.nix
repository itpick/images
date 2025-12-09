{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-event-exporter-fips image
{
  name = "kubernetes-event-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-event-exporter-fips"
    exit 1
  '';
}
