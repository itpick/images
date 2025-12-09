{ pkgs, lib, ... }:

# TODO: Add tests for node-problem-detector image
{
  name = "node-problem-detector";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for node-problem-detector"
    exit 1
  '';
}
