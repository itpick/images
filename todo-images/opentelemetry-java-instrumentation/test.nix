{ pkgs, lib, ... }:

# TODO: Add tests for opentelemetry-java-instrumentation image
{
  name = "opentelemetry-java-instrumentation";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opentelemetry-java-instrumentation"
    exit 1
  '';
}
