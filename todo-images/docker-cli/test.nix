{ pkgs, lib, ... }:

# TODO: Add tests for docker-cli image
{
  name = "docker-cli";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for docker-cli"
    exit 1
  '';
}
