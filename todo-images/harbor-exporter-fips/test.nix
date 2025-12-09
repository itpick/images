{ pkgs, lib, ... }:

# TODO: Add tests for harbor-exporter-fips image
{
  name = "harbor-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for harbor-exporter-fips"
    exit 1
  '';
}
