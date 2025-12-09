{ pkgs, lib, ... }:

# TODO: Add tests for kafka-bridge image
{
  name = "kafka-bridge";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kafka-bridge"
    exit 1
  '';
}
