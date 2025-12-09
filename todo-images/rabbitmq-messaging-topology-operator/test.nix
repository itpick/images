{ pkgs, lib, ... }:

# TODO: Add tests for rabbitmq-messaging-topology-operator image
{
  name = "rabbitmq-messaging-topology-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rabbitmq-messaging-topology-operator"
    exit 1
  '';
}
