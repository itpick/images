{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-lambda image
{
  name = "crossplane-aws-lambda";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-lambda"
    exit 1
  '';
}
