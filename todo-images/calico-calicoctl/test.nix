{ pkgs, lib, ... }:

# TODO: Add tests for calico-calicoctl image
{
  name = "calico-calicoctl";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-calicoctl"
    exit 1
  '';
}
