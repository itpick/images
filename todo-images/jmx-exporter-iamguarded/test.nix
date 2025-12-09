{ pkgs, lib, ... }:

# TODO: Add tests for jmx-exporter-iamguarded image
{
  name = "jmx-exporter-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jmx-exporter-iamguarded"
    exit 1
  '';
}
