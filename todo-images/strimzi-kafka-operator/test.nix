{ pkgs, lib, ... }:

# TODO: Add tests for strimzi-kafka-operator image
{
  name = "strimzi-kafka-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for strimzi-kafka-operator"
    exit 1
  '';
}
