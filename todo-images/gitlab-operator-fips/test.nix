{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-operator-fips image
{
  name = "gitlab-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-operator-fips"
    exit 1
  '';
}
