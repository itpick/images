{ pkgs, lib, ... }:

# TODO: Add tests for rabbitmq image
{
  name = "rabbitmq";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rabbitmq"
    exit 1
  '';
}
