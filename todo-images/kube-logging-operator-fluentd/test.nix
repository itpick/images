{ pkgs, lib, ... }:

# TODO: Add tests for kube-logging-operator-fluentd image
{
  name = "kube-logging-operator-fluentd";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-logging-operator-fluentd"
    exit 1
  '';
}
