{ pkgs, lib, ... }:

# TODO: Add tests for aws-node-termination-handler image
{
  name = "aws-node-termination-handler";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-node-termination-handler"
    exit 1
  '';
}
