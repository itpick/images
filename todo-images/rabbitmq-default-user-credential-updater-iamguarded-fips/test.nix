{ pkgs, lib, ... }:

# TODO: Add tests for rabbitmq-default-user-credential-updater-iamguarded-fips image
{
  name = "rabbitmq-default-user-credential-updater-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rabbitmq-default-user-credential-updater-iamguarded-fips"
    exit 1
  '';
}
