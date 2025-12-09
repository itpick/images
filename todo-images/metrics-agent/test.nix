{ pkgs, lib, ... }:

# TODO: Add tests for metrics-agent image
{
  name = "metrics-agent";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for metrics-agent"
    exit 1
  '';
}
