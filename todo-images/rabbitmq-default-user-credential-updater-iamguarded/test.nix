{ pkgs, lib, ... }:

# TODO: Add tests for rabbitmq-default-user-credential-updater-iamguarded image
{
  name = "rabbitmq-default-user-credential-updater-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rabbitmq-default-user-credential-updater-iamguarded"
    exit 1
  '';
}
