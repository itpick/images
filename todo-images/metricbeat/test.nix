{ pkgs, lib, ... }:

# TODO: Add tests for metricbeat image
{
  name = "metricbeat";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for metricbeat"
    exit 1
  '';
}
