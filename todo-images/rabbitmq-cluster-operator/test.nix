{ pkgs, lib, ... }:

# TODO: Add tests for rabbitmq-cluster-operator image
{
  name = "rabbitmq-cluster-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rabbitmq-cluster-operator"
    exit 1
  '';
}
