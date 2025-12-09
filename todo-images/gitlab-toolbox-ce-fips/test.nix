{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-toolbox-ce-fips image
{
  name = "gitlab-toolbox-ce-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-toolbox-ce-fips"
    exit 1
  '';
}
