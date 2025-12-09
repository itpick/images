{ pkgs, lib, ... }:

# TODO: Add tests for thanos-receive-controller-fips image
{
  name = "thanos-receive-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for thanos-receive-controller-fips"
    exit 1
  '';
}
