{ pkgs, lib, ... }:

# TODO: Add tests for kafka-exporter-fips image
{
  name = "kafka-exporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kafka-exporter-fips"
    exit 1
  '';
}
