{ pkgs, lib, ... }:

# TODO: Add tests for victoria-metrics image
{
  name = "victoria-metrics";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for victoria-metrics"
    exit 1
  '';
}
