{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-collector image
{
  name = "jaeger-collector";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-collector"
    exit 1
  '';
}
