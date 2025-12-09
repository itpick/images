{ pkgs, lib, ... }:

# TODO: Add tests for kafka-iamguarded image
{
  name = "kafka-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kafka-iamguarded"
    exit 1
  '';
}
