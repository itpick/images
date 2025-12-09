{ pkgs, lib, ... }:

# TODO: Add tests for rabbitmq-iamguarded-fips image
{
  name = "rabbitmq-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rabbitmq-iamguarded-fips"
    exit 1
  '';
}
