{ pkgs, lib, ... }:

# TODO: Add tests for aws-gateway-controller image
{
  name = "aws-gateway-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-gateway-controller"
    exit 1
  '';
}
