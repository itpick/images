{ pkgs, lib, ... }:

# TODO: Add tests for etcd-iamguarded-fips image
{
  name = "etcd-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for etcd-iamguarded-fips"
    exit 1
  '';
}
