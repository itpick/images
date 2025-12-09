{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-firehose-fips image
{
  name = "crossplane-aws-firehose-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-firehose-fips"
    exit 1
  '';
}
