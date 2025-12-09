{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-kinesis-fips image
{
  name = "crossplane-aws-kinesis-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-kinesis-fips"
    exit 1
  '';
}
