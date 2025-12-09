{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-webservice-ce-fips image
{
  name = "gitlab-webservice-ce-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-webservice-ce-fips"
    exit 1
  '';
}
