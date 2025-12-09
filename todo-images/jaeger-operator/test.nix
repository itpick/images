{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-operator image
{
  name = "jaeger-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-operator"
    exit 1
  '';
}
