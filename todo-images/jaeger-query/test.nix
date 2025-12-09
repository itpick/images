{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-query image
{
  name = "jaeger-query";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-query"
    exit 1
  '';
}
