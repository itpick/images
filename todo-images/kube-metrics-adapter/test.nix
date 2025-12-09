{ pkgs, lib, ... }:

# TODO: Add tests for kube-metrics-adapter image
{
  name = "kube-metrics-adapter";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-metrics-adapter"
    exit 1
  '';
}
