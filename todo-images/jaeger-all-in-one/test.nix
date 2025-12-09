{ pkgs, lib, ... }:

# TODO: Add tests for jaeger-all-in-one image
{
  name = "jaeger-all-in-one";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jaeger-all-in-one"
    exit 1
  '';
}
