{ pkgs, lib, ... }:

# TODO: Add tests for rabbitmq-messaging-topology-operator-iamguarded image
{
  name = "rabbitmq-messaging-topology-operator-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rabbitmq-messaging-topology-operator-iamguarded"
    exit 1
  '';
}
