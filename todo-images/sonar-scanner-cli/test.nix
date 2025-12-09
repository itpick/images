{ pkgs, lib, ... }:

# TODO: Add tests for sonar-scanner-cli image
{
  name = "sonar-scanner-cli";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sonar-scanner-cli"
    exit 1
  '';
}
