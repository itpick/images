{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-event-exporter-iamguarded-fips image
{
  name = "kubernetes-event-exporter-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-event-exporter-iamguarded-fips"
    exit 1
  '';
}
