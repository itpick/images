{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-runner-fips image
{
  name = "gitlab-runner-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-runner-fips"
    exit 1
  '';
}
