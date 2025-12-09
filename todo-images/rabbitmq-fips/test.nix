{ pkgs, lib, ... }:

# TODO: Add tests for rabbitmq-fips image
{
  name = "rabbitmq-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rabbitmq-fips"
    exit 1
  '';
}
