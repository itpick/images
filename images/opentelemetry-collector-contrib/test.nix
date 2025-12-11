{ pkgs, lib, ... }:

# TODO: Add tests for opentelemetry-collector-contrib image
{
  name = "opentelemetry-collector-contrib";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opentelemetry-collector-contrib"
    exit 1
  '';
}
