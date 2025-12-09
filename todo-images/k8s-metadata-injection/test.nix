{ pkgs, lib, ... }:

# TODO: Add tests for k8s-metadata-injection image
{
  name = "k8s-metadata-injection";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k8s-metadata-injection"
    exit 1
  '';
}
