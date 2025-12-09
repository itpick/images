{ pkgs, lib, ... }:

# TODO: Add tests for etcd-iamguarded image
{
  name = "etcd-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for etcd-iamguarded"
    exit 1
  '';
}
