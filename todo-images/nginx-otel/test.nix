{ pkgs, lib, ... }:

# TODO: Add tests for nginx-otel image
{
  name = "nginx-otel";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nginx-otel"
    exit 1
  '';
}
