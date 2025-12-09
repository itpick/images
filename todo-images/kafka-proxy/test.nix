{ pkgs, lib, ... }:

# TODO: Add tests for kafka-proxy image
{
  name = "kafka-proxy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kafka-proxy"
    exit 1
  '';
}
