{ pkgs, lib, ... }:

# TODO: Add tests for rabbitmq-messaging-topology-operator-iamguarded-fips image
{
  name = "rabbitmq-messaging-topology-operator-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rabbitmq-messaging-topology-operator-iamguarded-fips"
    exit 1
  '';
}
