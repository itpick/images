{ pkgs, lib, ... }:

# TODO: Add tests for apache-exporter image
{
  name = "apache-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for apache-exporter"
    exit 1
  '';
}
