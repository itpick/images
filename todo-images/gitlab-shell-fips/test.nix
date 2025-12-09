{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-shell-fips image
{
  name = "gitlab-shell-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-shell-fips"
    exit 1
  '';
}
