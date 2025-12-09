{ pkgs, lib, ... }:

# TODO: Add tests for openbao-k8s image
{
  name = "openbao-k8s";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for openbao-k8s"
    exit 1
  '';
}
