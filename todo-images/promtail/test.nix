{ pkgs, lib, ... }:

# TODO: Add tests for promtail image
{
  name = "promtail";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for promtail"
    exit 1
  '';
}
