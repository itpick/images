{ pkgs, lib, ... }:

# TODO: Add tests for kube-bench image
{
  name = "kube-bench";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-bench"
    exit 1
  '';
}
