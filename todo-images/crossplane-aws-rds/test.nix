{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-rds image
{
  name = "crossplane-aws-rds";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-rds"
    exit 1
  '';
}
