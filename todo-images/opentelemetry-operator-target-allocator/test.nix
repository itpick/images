{ pkgs, lib, ... }:

# TODO: Add tests for opentelemetry-operator-target-allocator image
{
  name = "opentelemetry-operator-target-allocator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opentelemetry-operator-target-allocator"
    exit 1
  '';
}
