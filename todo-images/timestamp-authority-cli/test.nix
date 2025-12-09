{ pkgs, lib, ... }:

# TODO: Add tests for timestamp-authority-cli image
{
  name = "timestamp-authority-cli";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for timestamp-authority-cli"
    exit 1
  '';
}
