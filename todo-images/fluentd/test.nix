{ pkgs, lib, ... }:

# TODO: Add tests for fluentd image
{
  name = "fluentd";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for fluentd"
    exit 1
  '';
}
