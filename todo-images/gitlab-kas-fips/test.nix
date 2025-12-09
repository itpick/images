{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-kas-fips image
{
  name = "gitlab-kas-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-kas-fips"
    exit 1
  '';
}
