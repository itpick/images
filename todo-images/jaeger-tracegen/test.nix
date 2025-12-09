{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-tracegen image
{
  name = "jaeger-tracegen";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-tracegen"
    exit 1
  '';
}
