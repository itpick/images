{ pkgs, lib, ... }:

# TODO: Add tests for kube-arangodb image
{
  name = "kube-arangodb";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-arangodb"
    exit 1
  '';
}
