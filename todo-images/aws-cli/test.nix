{ pkgs, lib, ... }:

# TODO: Add tests for aws-cli image
{
  name = "aws-cli";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-cli"
    exit 1
  '';
}
