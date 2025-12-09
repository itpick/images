{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-base-fips image
{
  name = "gitlab-base-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-base-fips"
    exit 1
  '';
}
