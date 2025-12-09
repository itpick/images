{ pkgs, lib, ... }:

# TODO: Add tests for zipkin image
{
  name = "zipkin";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for zipkin"
    exit 1
  '';
}
