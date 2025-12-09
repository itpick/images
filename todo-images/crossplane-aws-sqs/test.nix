{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-sqs image
{
  name = "crossplane-aws-sqs";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-sqs"
    exit 1
  '';
}
