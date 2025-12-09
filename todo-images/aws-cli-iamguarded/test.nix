{ pkgs, lib, ... }:

# TODO: Add tests for aws-cli-iamguarded image
{
  name = "aws-cli-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-cli-iamguarded"
    exit 1
  '';
}
