{ pkgs, lib, ... }:

# TODO: Add tests for aws-node-termination-handler-fips image
{
  name = "aws-node-termination-handler-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-node-termination-handler-fips"
    exit 1
  '';
}
