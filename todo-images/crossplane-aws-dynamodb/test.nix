{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-dynamodb image
{
  name = "crossplane-aws-dynamodb";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-dynamodb"
    exit 1
  '';
}
