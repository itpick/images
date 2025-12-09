{ pkgs, lib, ... }:

# TODO: Add tests for rabbitmq-cluster-operator-iamguarded-fips image
{
  name = "rabbitmq-cluster-operator-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rabbitmq-cluster-operator-iamguarded-fips"
    exit 1
  '';
}
