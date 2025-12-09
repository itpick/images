{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-container-registry-fips image
{
  name = "gitlab-container-registry-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-container-registry-fips"
    exit 1
  '';
}
