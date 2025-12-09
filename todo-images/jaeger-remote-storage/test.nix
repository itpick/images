{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-remote-storage image
{
  name = "jaeger-remote-storage";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-remote-storage"
    exit 1
  '';
}
