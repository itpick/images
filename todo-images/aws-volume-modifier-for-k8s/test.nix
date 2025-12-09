{ pkgs, lib, ... }:

# TODO: Add tests for aws-volume-modifier-for-k8s image
{
  name = "aws-volume-modifier-for-k8s";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-volume-modifier-for-k8s"
    exit 1
  '';
}
