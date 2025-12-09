{ pkgs, lib, ... }:

# TODO: Add tests for zipkin-slim image
{
  name = "zipkin-slim";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for zipkin-slim"
    exit 1
  '';
}
