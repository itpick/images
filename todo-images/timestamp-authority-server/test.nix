{ pkgs, lib, ... }:

# TODO: Add tests for timestamp-authority-server image
{
  name = "timestamp-authority-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for timestamp-authority-server"
    exit 1
  '';
}
