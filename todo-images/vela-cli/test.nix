{ pkgs, lib, ... }:

# TODO: Add tests for vela-cli image
{
  name = "vela-cli";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vela-cli"
    exit 1
  '';
}
