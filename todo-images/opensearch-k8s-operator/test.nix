{ pkgs, lib, ... }:

# TODO: Add tests for opensearch-k8s-operator image
{
  name = "opensearch-k8s-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opensearch-k8s-operator"
    exit 1
  '';
}
