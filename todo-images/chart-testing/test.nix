{ pkgs, lib, ... }:

# TODO: Add tests for chart-testing image
{
  name = "chart-testing";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for chart-testing"
    exit 1
  '';
}
