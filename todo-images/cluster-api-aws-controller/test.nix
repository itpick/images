{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-aws-controller image
{
  name = "cluster-api-aws-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-aws-controller"
    exit 1
  '';
}
