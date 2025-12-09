{ pkgs, lib, ... }:

# TODO: Add tests for kubectl-fips image
{
  name = "kubectl-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubectl-fips"
    exit 1
  '';
}
