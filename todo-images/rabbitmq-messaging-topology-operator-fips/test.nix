{ pkgs, lib, ... }:

# TODO: Add tests for rabbitmq-messaging-topology-operator-fips image
{
  name = "rabbitmq-messaging-topology-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rabbitmq-messaging-topology-operator-fips"
    exit 1
  '';
}
