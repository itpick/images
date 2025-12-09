{ pkgs, lib, ... }:

# TODO: Add tests for fluentd-iamguarded image
{
  name = "fluentd-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for fluentd-iamguarded"
    exit 1
  '';
}
