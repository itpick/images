{ pkgs, lib, ... }:

# TODO: Add tests for opentelemetry-collector image
{
  name = "opentelemetry-collector";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opentelemetry-collector"
    exit 1
  '';
}
