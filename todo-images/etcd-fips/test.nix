{ pkgs, lib, ... }:

# TODO: Add tests for etcd-fips image
{
  name = "etcd-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for etcd-fips"
    exit 1
  '';
}
