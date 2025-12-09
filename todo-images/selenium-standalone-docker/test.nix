{ pkgs, lib, ... }:

# TODO: Add tests for selenium-standalone-docker image
{
  name = "selenium-standalone-docker";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for selenium-standalone-docker"
    exit 1
  '';
}
