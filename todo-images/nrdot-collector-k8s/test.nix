{ pkgs, lib, ... }:

# TODO: Add tests for nrdot-collector-k8s image
{
  name = "nrdot-collector-k8s";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nrdot-collector-k8s"
    exit 1
  '';
}
