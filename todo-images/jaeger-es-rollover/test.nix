{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-es-rollover image
{
  name = "jaeger-es-rollover";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-es-rollover"
    exit 1
  '';
}
