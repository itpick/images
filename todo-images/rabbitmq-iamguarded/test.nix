{ pkgs, lib, ... }:

# TODO: Add tests for rabbitmq-iamguarded image
{
  name = "rabbitmq-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rabbitmq-iamguarded"
    exit 1
  '';
}
