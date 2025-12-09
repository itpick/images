{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-es-index-cleaner image
{
  name = "jaeger-es-index-cleaner";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-es-index-cleaner"
    exit 1
  '';
}
