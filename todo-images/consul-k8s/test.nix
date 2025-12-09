{ pkgs, lib, ... }:

# TODO: Add tests for consul-k8s image
{
  name = "consul-k8s";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for consul-k8s"
    exit 1
  '';
}
