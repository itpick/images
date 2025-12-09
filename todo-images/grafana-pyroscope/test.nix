{ pkgs, lib, ... }:

# TODO: Add tests for grafana-pyroscope image
{
  name = "grafana-pyroscope";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for grafana-pyroscope"
    exit 1
  '';
}
