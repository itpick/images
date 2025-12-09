{ pkgs, lib, ... }:

# TODO: Add tests for rabbitmq-cluster-operator-iamguarded image
{
  name = "rabbitmq-cluster-operator-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rabbitmq-cluster-operator-iamguarded"
    exit 1
  '';
}
