{ pkgs, lib, ... }:

# TODO: Add tests for confluent-kafka image
{
  name = "confluent-kafka";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for confluent-kafka"
    exit 1
  '';
}
