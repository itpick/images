{ pkgs, lib, ... }:

# TODO: Add tests for falco-exporter-fips image
{
  name = "falco-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for falco-exporter-fips"
    exit 1
  '';
}
