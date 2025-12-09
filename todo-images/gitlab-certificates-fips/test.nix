{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-certificates-fips image
{
  name = "gitlab-certificates-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-certificates-fips"
    exit 1
  '';
}
