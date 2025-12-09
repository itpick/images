{ pkgs, lib, ... }:

# TODO: Add tests for strimzi-kafka image
{
  name = "strimzi-kafka";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for strimzi-kafka"
    exit 1
  '';
}
