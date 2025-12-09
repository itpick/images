{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-mailroom-fips image
{
  name = "gitlab-mailroom-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-mailroom-fips"
    exit 1
  '';
}
