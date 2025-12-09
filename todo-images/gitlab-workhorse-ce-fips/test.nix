{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-workhorse-ce-fips image
{
  name = "gitlab-workhorse-ce-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-workhorse-ce-fips"
    exit 1
  '';
}
