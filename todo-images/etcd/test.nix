{ pkgs, lib, ... }:

# TODO: Add tests for etcd image
{
  name = "etcd";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for etcd"
    exit 1
  '';
}
