{ pkgs, lib, ... }:

# TODO: Add tests for kafka-exporter image
{
  name = "kafka-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kafka-exporter"
    exit 1
  '';
}
