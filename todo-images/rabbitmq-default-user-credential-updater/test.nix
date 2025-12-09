{ pkgs, lib, ... }:

# TODO: Add tests for rabbitmq-default-user-credential-updater image
{
  name = "rabbitmq-default-user-credential-updater";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rabbitmq-default-user-credential-updater"
    exit 1
  '';
}
