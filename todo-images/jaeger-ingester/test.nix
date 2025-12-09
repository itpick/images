{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-ingester image
{
  name = "jaeger-ingester";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-ingester"
    exit 1
  '';
}
