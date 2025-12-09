{ pkgs, lib, ... }:

# TODO: Add tests for statsd image
{
  name = "statsd";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for statsd"
    exit 1
  '';
}
