{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-kms image
{
  name = "crossplane-aws-kms";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-kms"
    exit 1
  '';
}
