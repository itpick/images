{ pkgs, lib, ... }:

# TODO: Add tests for rabbitmq-cluster-operator-fips image
{
  name = "rabbitmq-cluster-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rabbitmq-cluster-operator-fips"
    exit 1
  '';
}
