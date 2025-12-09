{ pkgs, lib, ... }:

# TODO: Add tests for flink image
{
  name = "flink";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flink"
    exit 1
  '';
}
