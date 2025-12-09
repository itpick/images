{ pkgs, lib, ... }:

# TODO: Add tests for apm-server image
{
  name = "apm-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for apm-server"
    exit 1
  '';
}
