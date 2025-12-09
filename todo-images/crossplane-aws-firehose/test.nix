{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-firehose image
{
  name = "crossplane-aws-firehose";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-firehose"
    exit 1
  '';
}
