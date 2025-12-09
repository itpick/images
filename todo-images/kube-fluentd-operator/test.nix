{ pkgs, lib, ... }:

# TODO: Add tests for kube-fluentd-operator image
{
  name = "kube-fluentd-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-fluentd-operator"
    exit 1
  '';
}
