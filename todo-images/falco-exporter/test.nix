{ pkgs, lib, ... }:

# TODO: Add tests for falco-exporter image
{
  name = "falco-exporter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for falco-exporter"
    exit 1
  '';
}
