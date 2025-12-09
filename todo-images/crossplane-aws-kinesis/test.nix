{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-kinesis image
{
  name = "crossplane-aws-kinesis";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-kinesis"
    exit 1
  '';
}
