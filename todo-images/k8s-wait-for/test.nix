{ pkgs, lib, ... }:

# TODO: Add tests for k8s-wait-for image
{
  name = "k8s-wait-for";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k8s-wait-for"
    exit 1
  '';
}
