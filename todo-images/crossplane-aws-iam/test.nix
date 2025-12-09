{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-iam image
{
  name = "crossplane-aws-iam";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-iam"
    exit 1
  '';
}
