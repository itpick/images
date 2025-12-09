{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-provider-gitlab-fips image
{
  name = "crossplane-provider-gitlab-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-provider-gitlab-fips"
    exit 1
  '';
}
