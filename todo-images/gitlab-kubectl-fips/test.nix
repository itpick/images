{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-kubectl-fips image
{
  name = "gitlab-kubectl-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-kubectl-fips"
    exit 1
  '';
}
