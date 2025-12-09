{ pkgs, lib, ... }:

# TODO: Add tests for step-cli image
{
  name = "step-cli";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for step-cli"
    exit 1
  '';
}
