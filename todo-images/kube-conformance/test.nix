{ pkgs, lib, ... }:

# TODO: Add tests for kube-conformance image
{
  name = "kube-conformance";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-conformance"
    exit 1
  '';
}
