{ pkgs, lib, ... }:

# TODO: Add tests for kubectl-iamguarded-fips image
{
  name = "kubectl-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubectl-iamguarded-fips"
    exit 1
  '';
}
