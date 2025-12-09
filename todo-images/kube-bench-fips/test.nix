{ pkgs, lib, ... }:

# TODO: Add tests for kube-bench-fips image
{
  name = "kube-bench-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-bench-fips"
    exit 1
  '';
}
