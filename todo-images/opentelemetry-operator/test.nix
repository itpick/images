{ pkgs, lib, ... }:

# TODO: Add tests for opentelemetry-operator image
{
  name = "opentelemetry-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opentelemetry-operator"
    exit 1
  '';
}
