{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-runner-helper-fips image
{
  name = "gitlab-runner-helper-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-runner-helper-fips"
    exit 1
  '';
}
